provider "yandex" {
  # Укажите вашу авторизационную информацию
  token     = "${var.token}"
  cloud_id  = "${var.cloud_id}"
  folder_id = "${var.folder_id}"
  zone      = "ru-central1-a" # Или другая зона по вашему выбору
}