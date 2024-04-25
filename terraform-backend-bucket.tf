# Замените "terraform-backend-bucket" на имя вашего S3 бакета, а также укажите правильный регион в параметре region.

terraform {
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket         = "terraform-bucket"
    key            = "terraform.tfstate"
    region         = "ru-central1"
    access_key     = yandex_iam_service_account_static_access_key.sa-static-key.access_key
    secret_key     = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
    # shared_credentials_file = "authorized_key.json"
    skip_region_validation = true
    skip_credentials_validation = true
  }
}

resource "yandex_kms_symmetric_key" "kms-key" {
  # Ключ для шифрования важной информации, такой как пароли, OAuth-токены и SSH-ключи.
  folder_id         = var.folder_id
  name              = "kms-key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" # 1 год.
}

resource "yandex_kms_symmetric_key_iam_binding" "viewer" {
  symmetric_key_id = yandex_kms_symmetric_key.kms-key.id
  role             = "viewer"
  members = [
    "serviceAccount:${yandex_iam_service_account.sa.id}",
  ]
}