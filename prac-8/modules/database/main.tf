resource "random_password" "db_password" {
  length           = 24
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "yandex_mdb_postgresql_cluster" "database" {
  name               = "${var.resource_prefix}-postgres"
  description        = "PostgreSQL cluster for ${var.app_name}"
  environment        = "PRODUCTION"
  network_id         = var.network_id
  security_group_ids = [var.security_group_id]
  labels             = var.tags

  config {
    version = var.postgres_version
    resources {
      resource_preset_id = var.postgres_preset
      disk_type_id       = "network-ssd"
      disk_size          = var.postgres_disk_size
    }
  }

  host {
    zone             = var.zone
    subnet_id        = var.subnet_id
    assign_public_ip = false
  }

  maintenance_window {
    type = "WEEKLY"
    day  = "SUN"
    hour = 2
  }
}

resource "yandex_mdb_postgresql_user" "admin" {
  cluster_id = yandex_mdb_postgresql_cluster.database.id
  name       = var.db_user
  password   = random_password.db_password.result
}

resource "yandex_mdb_postgresql_database" "main_db" {
  cluster_id = yandex_mdb_postgresql_cluster.database.id
  name       = var.db_name
  owner      = yandex_mdb_postgresql_user.admin.name
  
  depends_on = [yandex_mdb_postgresql_user.admin]
}
