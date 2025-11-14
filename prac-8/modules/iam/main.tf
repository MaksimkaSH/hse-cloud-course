resource "yandex_iam_service_account" "storage_sa" {
  name        = "${var.resource_prefix}-storage-account"
  folder_id   = var.folder_id
  description = "Service account for S3 storage management"
}

resource "yandex_resourcemanager_folder_iam_member" "storage_admin" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.storage_sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "storage_key" {
  service_account_id = yandex_iam_service_account.storage_sa.id
  description        = "Static key for object storage access"
}
