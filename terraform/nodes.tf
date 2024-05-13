resource "yandex_compute_instance" "cluster-k8s" {  
  count = length(var.zones) // Создаем экземпляр VM для каждой зоны из списка
  name                      = "node-${count.index}"
  zone                      = var.zones[count.index]    # Использование переменной subnet-zones для определения зоны экземпляра
  hostname                  = "node-${count.index}"
  # location = "standard-v1"
  allow_stopping_for_update = true
  # labels = {
  #   index = "${count.index}"
  # } 

  scheduling_policy {
  preemptible = true  // Прерываемая ВМ
  }

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004-lts}"
      type        = "network-ssd"
      size        = "20"
    }
  }


network_interface {
    subnet_id = yandex_vpc_subnet.zones[count.index].id 
    nat       = true
    // Другие параметры сетевого интерфейса
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}