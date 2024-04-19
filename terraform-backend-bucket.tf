# Замените "terraform-backend-bucket" на имя вашего S3 бакета, а также укажите правильный регион в параметре region.

terraform {
  backend "s3" {
    endpoint = "https://storage.yandexcloud.net"
    bucket         = "terraform-backend-bucket"
    key            = "terraform.tfstate"
    region         = "ru-central1"
    skip_region_validation = true
    skip_credentials_validation = true
#    skip_metadata_api_check = true
    access_key =  #yandex_iam_service_account_static_access_key.bucket-static_access_key.access_key""
    secret_key =  #yandex_iam_service_account_static_access_key.bucket-static_access_key.secret_key
  }
}