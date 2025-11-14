resource "yandex_storage_bucket" "app_storage" {
  access_key = var.access_key
  secret_key = var.secret_key
  
  bucket = "${var.resource_prefix}-storage-${var.unique_suffix}"
  
  versioning {
    enabled = true
  }
  
  lifecycle_rule {
    id      = "cleanup-old-versions"
    enabled = true
    
    noncurrent_version_expiration {
      days = 90
    }
  }
}
