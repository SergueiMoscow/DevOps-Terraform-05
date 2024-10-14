terraform {
  required_version = ">= 1.3.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.130.0"
    }
  }
}

provider "yandex" {
  token                 = var.yc_token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  # service_account_key _file = file("~/.yc_authorized_key.json")
  zone                     = var.default_zone
}
