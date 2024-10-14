output "service_account" {
  value = {
    key_id             = yandex_iam_service_account_static_access_key.this.id
    access_key         = yandex_iam_service_account_static_access_key.this.access_key
    secret_key         = yandex_iam_service_account_static_access_key.this.secret_key
    service_account_id = yandex_iam_service_account.this.id
  }
  sensitive = true
}

# output "bucket_id" {
#   value = yandex_storage_bucket.this.id
# }

# output "ydb_id" {
#   value = yandex_ydb_database_serverless.this.id
# }