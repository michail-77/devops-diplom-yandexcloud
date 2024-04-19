resource "yandex_iam_service_account" "service_account" {
  name        = "my-service-account"
  description = "Service account for managing Yandex.Cloud resources"

  folder_id = var.folder_id
}

resource "yandex_iam_service_account_iam_binding" "service_account_binding" {
  service_account_id = yandex_iam_service_account.service_account.id
  role               = "roles/editor" # Или другая необходимая роль, например, roles/k8s.admin

  members = [
    "serviceAccount:${yandex_iam_service_account.service_account.email}"
  ]
}

output "service_account_id" {
  value = yandex_iam_service_account.service_account.id
}

output "service_account_email" {
  value = yandex_iam_service_account.service_account.email
}


resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
 service_account_id = var.service_account_id
 description        = "sa-static-key"
}

# Создание статического ключа доступа (для доступа к бэкэнду хранилища)
resource "yandex_iam_service_account_static_access_key" "bucket-static_access_key" {
  service_account_id = yandex_iam_service_account.bucket-sa.id
  description        = "Static access key for Terraform Backend Bucket"
}

## Создаем ключи для сервисного аккаунта (для доступа к объектному хранилищу)
#resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
#  service_account_id = yandex_iam_service_account.bucket-sa.id
#  description        = "static access key for object storage"
#}

resource "yandex_iam_service_account_key" "sa-auth-key" {
  service_account_id = "some_sa_id"
  description        = "key for service account"
}