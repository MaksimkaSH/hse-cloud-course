output "db_host" {
  description = "Database host FQDN"
  value       = yandex_mdb_postgresql_cluster.database.host[0].fqdn
}

output "db_name" {
  description = "Database name"
  value       = yandex_mdb_postgresql_database.main_db.name
}

output "db_user" {
  description = "Database username"
  value       = yandex_mdb_postgresql_user.admin.name
}

output "db_password" {
  description = "Database password"
  value       = random_password.db_password.result
  sensitive   = true
}

output "connection_string" {
  description = "PostgreSQL connection string"
  value       = "postgresql://${yandex_mdb_postgresql_user.admin.name}:${random_password.db_password.result}@${yandex_mdb_postgresql_cluster.database.host[0].fqdn}:6432/${yandex_mdb_postgresql_database.main_db.name}"
  sensitive   = true
}
