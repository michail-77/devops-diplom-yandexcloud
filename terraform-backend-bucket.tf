# Замените "terraform-backend-bucket" на имя вашего S3 бакета, а также укажите правильный регион в параметре region.

terraform {
  backend "s3" {
    bucket         = "terraform-backend-bucket"
    key            = "terraform.tfstate"
    region         = "ru-central1"
    endpoint       = "storage.yandexcloud.net"
    skip_region_validation = true
    skip_credentials_validation = true
    skip_metadata_api_check = true
  }
}