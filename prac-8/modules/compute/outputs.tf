output "external_ip" {
  description = "Public IP address"
  value       = yandex_compute_instance.app_server.network_interface[0].nat_ip_address
}

output "internal_ip" {
  description = "Internal IP address"
  value       = yandex_compute_instance.app_server.network_interface[0].ip_address
}

output "instance_id" {
  description = "Instance ID"
  value       = yandex_compute_instance.app_server.id
}
