
variable "token" {
  type = string
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
  description = "Идентификатор папки, в которую будет назначен участник IAM"
}

variable "yc-zone" {
  default = "ru-central1"
}

variable "service_account_id" {
  type = string
}

# variable "db_password" {
#   type        = string
#   sensitive   = true
# }

variable "access_key" {
  type        = string
  sensitive   = true
}

variable "secret_key" {
  type        = string
  sensitive   = true
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "ubuntu-2004-lts" {
  default = "fd852pbtueis1q0pbt4o"
}

