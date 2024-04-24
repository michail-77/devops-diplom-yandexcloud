resource "yandex_vpc_network" "network" {
  name        = "my-network"
  description = "My Virtual Network"
  folder_id   = var.folder_id
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "my-subnet"
  folder_id      = var.folder_id
  zone           = yandex_vpc_subnet.subnet_zone_a.id
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.10.20.0/24"]
}


# Создание виртуальной частной сети (VPC)
resource "yandex_vpc_network" "my_vpc_network" {
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

resource "yandex_vpc_subnet" "subnet_zone_c" {
  name           = "subnet-zone-c"
  network_id     = yandex_vpc_network.my_vpc_network.id
  zone           = "ru-central1-c"
  v4_cidr_blocks = ["10.10.3.0/24"]
}