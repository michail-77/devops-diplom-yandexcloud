# Этот код Terraform создает S3 бакет в Яндекс Облаке с именем "terraform-backend-bucket"  
# и настраивает его для использования в качестве бэкэнда для Terraform. Замените "your_region" на регион,  
# в котором вы хотите создать бакет. После применения этой конфигурации Terraform будет использовать S3 бакет в Яндекс Облаке  
# в качестве бэкэнда для хранения состояния инфраструктуры.

resource "yandex_storage_bucket" "terraform_backend_bucket" {
  name          = "terraform-backend-bucket"
  access_policy = data.yandex_storage_bucket_policy.policy.json
}

data "yandex_storage_bucket_policy" "policy" {
  bucket_name = yandex_storage_bucket.terraform_backend_bucket.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "s3:*",
      Resource  = [
        "${yandex_storage_bucket.terraform_backend_bucket.arn}",
        "${yandex_storage_bucket.terraform_backend_bucket.arn}/*",
      ],
    }],
  })
}

#terraform {
#  backend "s3" {
#    bucket         = yandex_storage_bucket.terraform_backend_bucket.name
#    key            = "terraform.tfstate"
#    region         = "ru-central1"
#    endpoint       = "storage.yandexcloud.net"
#    skip_region_validation = true
#    skip_credentials_validation = true
#    skip_metadata_api_check = true
#  }
#}