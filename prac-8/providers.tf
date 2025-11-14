variable "yc_zone" {
  description = "Availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "yc_token" {
  description = "OAuth or IAM token"
  type        = string
  sensitive   = true
}

data "yandex_client_config" "client" {
  provider = yandex
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.yc_zone
}
