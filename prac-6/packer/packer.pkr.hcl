variable "token" {
  type      = string
  sensitive = true
}

variable "folder_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}

packer {
  required_plugins {
    yandex = {
      version = "~> 1"
      source  = "github.com/hashicorp/yandex"
    }
    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "yandex" "flask-app" {
  token               = var.token
  folder_id           = var.folder_id
  source_image_family = "ubuntu-2204-lts"
  ssh_username        = "ubuntu"
  use_ipv4_nat        = "true"
  image_description   = "ubuntu with nginx + flask"
  image_family        = "ubuntu-flask"
  image_name          = "ubuntu-flask-{{timestamp}}"
  subnet_id           = var.subnet_id
  disk_type           = "network-ssd"
  zone                = var.zone
}

build {
  sources = ["source.yandex.flask-app"]

  provisioner "ansible" {
    playbook_file = "ansible/playbook.yml"
  }
}