# НЕ ЗАКОНЧЕНО!!!
# service account
resource "yandex_iam_service_account" "this" {
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
  bucket        = var.bucket_name
  acl         = "private"
}

# YDB
# https://terraform-provider.yandexcloud.net/Resources/ydb_database_serverless
resource "yandex_ydb_database_serverless" "this" {
  name        = var.db_name
  folder_id   = var.folder_id

  # location {
  #   zone_id = var.yandex_zone
  # }

  # resources {
  #   resource_preset_id = "s2.micro"
  #   disk_type_id = "network-ssd"
  #   disk_size    = 10
  # }
}

# https://yandex.cloud/ru/docs/iam/operations/sa/assign-role-for-sa
resource "yandex_resourcemanager_folder_iam_member" "editor-account-iam" {
  folder_id   = var.folder_id
  role        = "editor"
  member      = "serviceAccount:${yandex_iam_service_account.this.id}"
}


# Привязка к политике
# https://terraform-provider.yandexcloud.net/Resources/ydb_database_iam_binding
resource "yandex_ydb_database_iam_binding" "this" {
  database_id = yandex_ydb_database_serverless.this.id
  role = "ydb.editor"
  members = [
    "serviceAccount:${yandex_iam_service_account.this.id}"
  ]
}