# resource "yandex_kubernetes_cluster" "k8s_cluster" {
#   name         = "my-k8s-cluster"
#   folder_id    = var.folder_id
#   zone         = var.subnet-zones
#   network_id   = yandex_vpc_network.network.id
#   subnet_ids   = [yandex_vpc_subnet.subnet.id]
# #  service_account_id = var.service_account_id
#   node_service_account_id = var.service_account_id    #"your-node-service-account-id"

#   master {
#     zonal_master {
#       version = "1.22"
#     }
#   }

#   node_pool {
#     name = "default-pool"
#     version = "1.22"
#     machine_type = "e2-small"
#     initial_node_count = 3
#     auto_upgrade = true
#     auto_repair = true
#     preemptible = true
#   }
# }



resource "yandex_kubernetes_cluster" "k8s_cluster" {
 network_id = yandex_vpc_network.my_vpc_network.id
 master {
   master_location {
     zone      = yandex_vpc_subnet.<имя_подсети>.zone
     subnet_id = yandex_vpc_subnet.<имя_подсети>.id
   }
 }
 service_account_id      = yandex_iam_service_account.<имя_сервисного_аккаунта>.id
 node_service_account_id = yandex_iam_service_account.<имя_сервисного_аккаунта>.id
   depends_on = [
     yandex_resourcemanager_folder_iam_member.editor,
     yandex_resourcemanager_folder_iam_member.images-puller
   ]
}

resource "yandex_vpc_network" "<имя_сети>" { name = "<имя_сети>" }

resource "yandex_vpc_subnet" "<имя_подсети>" {
 v4_cidr_blocks = ["<диапазон_адресов_подсети>"]
 zone           = "<зона_доступности>"
 network_id     = yandex_vpc_network.<имя_сети>.id
}

resource "yandex_iam_service_account" "<имя_сервисного_аккаунта>" {
 name        = "<имя_сервисного_аккаунта>"
 description = "<описание_сервисного_аккаунта>"
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
 # Сервисному аккаунту назначается роль "editor".
 folder_id = "<идентификатор_каталога>"
 role      = "editor"
 member    = "serviceAccount:${yandex_iam_service_account.<имя_сервисного_аккаунта>.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "images-puller" {
 # Сервисному аккаунту назначается роль "container-registry.images.puller".
 folder_id = "<идентификатор_каталога>"
 role      = "container-registry.images.puller"
 member    = "serviceAccount:${yandex_iam_service_account.<имя_сервисного_аккаунта>.id}"
}

