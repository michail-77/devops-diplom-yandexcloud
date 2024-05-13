# Создание виртуальной частной сети (VPC)
resource "yandex_vpc_network" "my_vpc_network" {
  folder_id     = var.folder_id
  name          = "my-vpc-network"
  description   = "VPC network for my infrastructure"
}

resource "yandex_vpc_subnet" "zones" {
  count = length(var.cidr.stage)

  name          = "my-subnet-${count.index}"
  network_id    = yandex_vpc_network.my_vpc_network.id
  zone          = var.zones[count.index]
  v4_cidr_blocks = [var.cidr["stage"][count.index]]
  depends_on = [
    yandex_vpc_network.my_vpc_network,
  ]
  // Другие параметры подсети...
}

variable "zones" {
 type    = list(string)
 default = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
}

variable "cidr" {
 type    = map(list(string))
 default = {
   stage = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]    
 }
}


# resource "yandex_vpc_subnet" "subnet-zones" {
#   count          = 3
#   name           = "subnet-${var.subnet-zones[count.index]}"
#   zone           = "${var.subnet-zones[count.index]}"
#   network_id     = "${yandex_vpc_network.subnet-zones.id}"
#   v4_cidr_blocks = [ "${var.cidr.stage[count.index]}" ]
# }

# # Определение ресурса yandex_vpc_subnet для каждой подсети
# resource "yandex_vpc_subnet" "subnet_zones" {
#   count           = length(var.subnet-zones)
#   name            = "subnet-${var.subnet-zones[count.index]}"
#   network_id      = yandex_vpc_network.my_vpc_network.id
#   zone            = var.subnet-zones[count.index]
#   v4_cidr_blocks  = ["10.10.${count.index}.0/24"]  # Пример диапазона IPv4 адресов
#   # Другие параметры подсети, если необходимо
# }

# //Создание подсетей в разных зонах доступности
# resource "yandex_vpc_subnet" "subnet_zone_a" {
#   name           = "subnet-zone-a"
#   network_id     = yandex_vpc_network.my_vpc_network.id
#   zone           = "ru-central1-a"
#   v4_cidr_blocks = ["10.10.1.0/24"]
# }

# resource "yandex_vpc_subnet" "subnet_zone_b" {
#   name           = "subnet-zone-b"
#   network_id     = yandex_vpc_network.my_vpc_network.id
#   zone           = "ru-central1-b"
#   v4_cidr_blocks = ["10.10.2.0/24"]
# }

# resource "yandex_vpc_subnet" "subnet_zone_d" {
#   name           = "subnet-zone-d"
#   network_id     = yandex_vpc_network.my_vpc_network.id
#   zone           = "ru-central1-d"
#   v4_cidr_blocks = ["10.10.3.0/24"]
# }
