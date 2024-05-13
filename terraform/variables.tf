
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

variable "service_account_id" {
  type = string
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "ubuntu-2004-lts" {
  default = "fd852pbtueis1q0pbt4o"
}

variable "service_account_key_file" {
  type  = string
}

variable "yc_auth_key_file" {
  type    = string
  # Другие настройки по необходимости
}

# variable "YC_IAM_TOKEN" {
#   type        = string
# }

