terraform {
  required_version = ">= 1.3.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.130.0"
    }
  }
}

provider {
  service_account_key_file = file("~/.yc_authorized_key.json")
}

data "yandex_organization_organization" "this" {}

data "yandex_cloud_id" "example" {}
