output "service_account_id" {
  description = "Service account ID"
  value       = yandex_iam_service_account.storage_sa.id
}

output "access_key" {
  description = "Access key for S3"
  value       = yandex_iam_service_account_static_access_key.storage_key.access_key
  sensitive   = true
}

output "secret_key" {
  description = "Secret key for S3"
  value       = yandex_iam_service_account_static_access_key.storage_key.secret_key
  sensitive   = true
}
