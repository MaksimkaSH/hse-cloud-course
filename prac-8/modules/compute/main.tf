data "yandex_compute_image" "os_image" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "app_server" {
  name        = "${var.resource_prefix}-server"
  hostname    = "${var.app_name}-${var.environment}"
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores  = var.instance_cores
    memory = var.instance_memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.os_image.id
      size     = var.instance_disk_size
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = true
    security_group_ids = [var.security_group_id]
  }

  metadata = {
    ssh-keys  = "ubuntu:${var.ssh_key}"
    user-data = templatefile("${path.module}/cloud-init.yaml", {
      app_name = var.app_name
    })
  }

  labels = merge(var.tags, {
    role = "application-server"
  })
}
