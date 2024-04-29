# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  # Укажите вашу авторизационную информацию
  service_account_key_file="authorized_key.json"
  # token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.yc-zone     # Или другая зона по вашему выбору
  # access_key     = var.yc_access_key
  # secret_key     = var.yc_secret_key
}

