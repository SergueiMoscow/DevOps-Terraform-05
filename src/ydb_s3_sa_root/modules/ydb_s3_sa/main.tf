# service account
resource "yandex_iam_service_account" "this" {
  folder_id   = var.folder_id
  name        = "sa-for-terraform"
  description = "terraform managed"
}

# access key
resource "yandex_iam_service_account_static_access_key" "this" {
  service_account_id = yandex_iam_service_account.this.id
  description        = "terraform managed"
}

# bucket
# https://terraform-provider.yandexcloud.net/Resources/storage_bucket
resource "yandex_storage_bucket" "this" {
  bucket     = var.bucket_name
  access_key = yandex_iam_service_account_static_access_key.this.access_key
  secret_key = yandex_iam_service_account_static_access_key.this.secret_key
}

# YDB
# https://terraform-provider.yandexcloud.net/Resources/ydb_database_serverless
resource "yandex_ydb_database_serverless" "this" {
  name        = var.db_name
  folder_id   = var.folder_id
}

# Grant permissions
# https://yandex.cloud/ru/docs/iam/operations/sa/assign-role-for-sa
resource "yandex_resourcemanager_folder_iam_member" "admin-account-iam" {
  folder_id   = var.folder_id
  role        = "admin"
  member      = "serviceAccount:${yandex_iam_service_account.this.id}"
}


# # Привязка к политике
# БД создаётся без этого. По всей видимости, тут нужно попробовать с другим типом сервисного аккаунта, не admin.
# # https://terraform-provider.yandexcloud.net/Resources/ydb_database_iam_binding
resource "yandex_ydb_database_iam_binding" "this" {
  database_id = yandex_ydb_database_serverless.this.id
  role = "ydb.editor"
  members = [
    "serviceAccount:${yandex_iam_service_account.this.id}"
  ]
}