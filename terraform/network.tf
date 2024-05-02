# Создание виртуальной частной сети (VPC)
resource "yandex_vpc_network" "my_vpc_network" {
  folder_id     = var.folder_id
  name          = "my-vpc-network"
  description   = "VPC network for my infrastructure"
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

resource "yandex_vpc_subnet" "subnet_zone_d" {
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