output "bucket_name" {
  description = "S3 bucket name"
  value       = yandex_storage_bucket.app_storage.bucket
}

output "bucket_id" {
  description = "S3 bucket ID"
  value       = yandex_storage_bucket.app_storage.id
}
