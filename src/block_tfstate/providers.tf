terraform {
  required_version = "1.8.4"

  backend "s3" {
    
    shared_credentials_files = ["~/.aws/credentials"]
    shared_config_files = [ "~/.aws/config" ]
    profile = "yandex"
    region="ru-central1"

    bucket     = "serguei" #FIO-netology-tfstate
    key = "production/terraform.tfstate"
    

    # access_key                  = "..."          #Только для примера! Не хардкодим секретные данные!
    # secret_key                  = "..."          #Только для примера! Не хардкодим секретные данные!


    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  endpoints ={
    dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gs3dkkmirep8agd6af/etnjed6ke5hcskdlmods"
    s3 = "https://storage.yandexcloud.net"
  }

    dynamodb_table              = "develop_tfstate"
  }

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.118.0"
    }
  }
}

provider "yandex" {
  # token                    = "do not use!!!"
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("~/.authorized_key.json")
  zone                     = var.default_zone
}
