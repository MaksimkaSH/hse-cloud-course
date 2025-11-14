output "server_external_ip" {
  description = "Public IP address of the application server"
  value       = module.compute.external_ip
}

output "server_internal_ip" {
  description = "Internal IP address of the application server"
  value       = module.compute.internal_ip
}

output "storage_bucket_name" {
  description = "Name of the S3 storage bucket"
  value       = module.storage.bucket_name
}

output "storage_access_key" {
  description = "Access key for S3 storage"
  value       = module.iam.access_key
  sensitive   = true
}

output "storage_secret_key" {
  description = "Secret key for S3 storage"
  value       = module.iam.secret_key
  sensitive   = true
}

output "database_host" {
  description = "PostgreSQL database host FQDN"
  value       = module.database.db_host
}

output "database_name" {
  description = "PostgreSQL database name"
  value       = module.database.db_name
}

output "database_user" {
  description = "PostgreSQL database username"
  value       = module.database.db_user
}

output "database_password" {
  description = "PostgreSQL database password"
  value       = module.database.db_password
  sensitive   = true
}

output "connection_string" {
  description = "PostgreSQL connection string"
  value       = module.database.connection_string
  sensitive   = true
}
