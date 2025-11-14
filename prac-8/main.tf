resource "random_string" "unique_id" {
  length  = 6
  upper   = false
  lower   = true
  numeric = true
  special = false
}

locals {
  resource_prefix = "${var.app_name}-${var.environment}"
  
  common_tags = {
    application = var.app_name
    environment = var.environment
    managed_by  = "terraform"
  }
  
  workspace_id = terraform.workspace
}

module "network" {
  source = "./modules/network"

  folder_id       = data.yandex_client_config.client.folder_id
  resource_prefix = local.resource_prefix
  network_cidr    = var.network_cidr
  subnet_cidr     = var.subnet_cidr
  zone            = var.yc_zone
  tags            = local.common_tags
}

module "iam" {
  source = "./modules/iam"

  folder_id       = data.yandex_client_config.client.folder_id
  resource_prefix = local.resource_prefix
}

module "storage" {
  source = "./modules/storage"

  resource_prefix = local.resource_prefix
  access_key      = module.iam.access_key
  secret_key      = module.iam.secret_key
  unique_suffix   = random_string.unique_id.result
}

module "compute" {
  source = "./modules/compute"

  resource_prefix     = local.resource_prefix
  app_name            = var.app_name
  environment         = var.environment
  zone                = var.yc_zone
  subnet_id           = module.network.subnet_id
  security_group_id   = module.network.app_security_group_id
  ssh_key             = var.admin_ssh_key
  instance_cores      = var.instance_cores
  instance_memory     = var.instance_memory
  instance_disk_size  = var.instance_disk_size
  tags                = local.common_tags
}

module "database" {
  source = "./modules/database"

  resource_prefix      = local.resource_prefix
  app_name             = var.app_name
  zone                 = var.yc_zone
  network_id           = module.network.network_id
  subnet_id            = module.network.subnet_id
  security_group_id    = module.network.database_security_group_id
  postgres_version     = var.postgres_version
  postgres_preset      = var.postgres_preset
  postgres_disk_size   = var.postgres_disk_size
  db_name              = var.db_name
  db_user              = var.db_user
  tags                 = local.common_tags
}
