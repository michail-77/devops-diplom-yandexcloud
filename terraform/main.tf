resource "yandex_iam_service_account" "sa" {
  name = "my-service-account"
  description = "service account"
 }

resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
  
  depends_on = [
    yandex_iam_service_account.sa
  ]
}
