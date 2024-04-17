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