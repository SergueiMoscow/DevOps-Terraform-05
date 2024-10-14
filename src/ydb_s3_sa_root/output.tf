output "service_account" {
  value = {
    key_id             = yandex_iam_service_account_static_access_key.this.id
    access_key         = yandex_iam_service_account_static_access_key.this.access_key
    secret_key         = yandex_iam_service_account_static_access_key.this.secret_key
    service_account_id = yandex_iam_service_account.this.id
    bucket_id          = yandex_storage_bucket.this.id
  }
  sensitive            = true
}