resource "yandex_vpc_network" "main" {
  name        = "${var.resource_prefix}-network"
  description = "Main VPC network"
  folder_id   = var.folder_id
  labels      = var.tags
}

resource "yandex_vpc_subnet" "main" {
  name           = "${var.resource_prefix}-subnet"
  description    = "Primary subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = [var.subnet_cidr]
  labels         = var.tags
}

resource "yandex_vpc_security_group" "app_sg" {
  name        = "${var.resource_prefix}-app-security-group"
  description = "Security group for application servers"
  network_id  = yandex_vpc_network.main.id
  labels      = var.tags

  ingress {
    description    = "Allow SSH access"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "Allow HTTP traffic"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "Allow HTTPS traffic"
    protocol       = "TCP"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description    = "Allow all outbound traffic"
    protocol       = "ANY"
    from_port      = 0
    to_port        = 65535
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_vpc_security_group" "database_sg" {
  name        = "${var.resource_prefix}-db-security-group"
  description = "Security group for PostgreSQL database"
  network_id  = yandex_vpc_network.main.id
  labels      = var.tags

  ingress {
    description       = "PostgreSQL from application servers"
    protocol          = "TCP"
    port              = 5432
    security_group_id = yandex_vpc_security_group.app_sg.id
  }

  egress {
    description    = "Allow all outbound traffic"
    protocol       = "ANY"
    from_port      = 0
    to_port        = 65535
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
