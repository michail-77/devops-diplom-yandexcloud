# resource "yandex_vpc_network" "yc-network" {
#   name        = "yc-network"
#   description = "My first network"
# }


# resource "yandex_vpc_network" "network" {
#   name        = "my-network"
#   description = "My Virtual Network"
#   folder_id   = var.folder_id
# }

# resource "yandex_vpc_subnet" "subnet" {
#   name           = "my-subnet"
#   folder_id      = var.folder_id
#   zone           = yandex_vpc_subnet.subnet_zone_a.id
#   network_id     = yandex_vpc_network.network.id
#   v4_cidr_blocks = ["10.10.20.0/24"]
# }


# Создание виртуальной частной сети (VPC)
resource "yandex_vpc_network" "my_vpc_network" {
  name          = "my-vpc-network"
  description   = "VPC network for my infrastructure"
  folder_id     = var.folder_id
}

# Создание подсетей в разных зонах доступности
resource "yandex_vpc_subnet" "subnet_zone_a" {
  name           = "subnet-zone-a"
  network_id     = yandex_vpc_network.my_vpc_network.id
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["10.10.1.0/24"]
}

resource "yandex_vpc_subnet" "subnet_zone_b" {
  name           = "subnet-zone-b"
  network_id     = yandex_vpc_network.my_vpc_network.id
  zone           = "ru-central1-b"
  v4_cidr_blocks = ["10.10.2.0/24"]
}

resource "yandex_vpc_subnet" "subnet_zone_c" {
  name           = "subnet-zone-d"
  network_id     = yandex_vpc_network.my_vpc_network.id
  zone           = "ru-central1-d"
  v4_cidr_blocks = ["10.10.3.0/24"]
}

# variable "subnet-zones" {
#  type    = list(string)
#  default = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
# }

# variable "cidr" {
#  type    = map(list(string))
#  default = {
#    stage = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]    
#  }
# }