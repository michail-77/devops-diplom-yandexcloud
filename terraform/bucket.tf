// Создание бакета с использованием ключа
resource "yandex_storage_bucket" "yc-state" {
  bucket     = "yc-state"
}
resource "yandex_storage_object" "tfstate" {
  # profile    = "my-aws-profile"
  bucket     = "yc-state"
  key        = "terraform.tfstate"
  source     = "./.terraform/terraform.tfstate"
}

// Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "статический ключ доступа к объектному хранилищу"
}


resource "yandex_resourcemanager_folder_iam_member" "images-puller" {
  folder_id = var.folder_id
  role   =  "editor" # "roles/editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
  depends_on = [
    yandex_iam_service_account.sa,
  ]
}

  