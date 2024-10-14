module "ydb_s3_sa" {
  source    = "./modules/ydb_s3_sa"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  network_id = var.network_id
  bucket_name = var.bucket_name
  db_name = var.db_name
}