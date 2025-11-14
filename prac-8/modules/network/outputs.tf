output "network_id" {
  description = "VPC network ID"
  value       = yandex_vpc_network.main.id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = yandex_vpc_subnet.main.id
}

output "app_security_group_id" {
  description = "Application security group ID"
  value       = yandex_vpc_security_group.app_sg.id
}

output "database_security_group_id" {
  description = "Database security group ID"
  value       = yandex_vpc_security_group.database_sg.id
}
