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
#     initial_node_count = 2
#     auto_upgrade = true
#     auto_repair = true
#     preemptible = true
#   }
# }



resource "yandex_kubernetes_cluster" "k8s_cluster" {
 count = length(var.cidr.stage)
 network_id = yandex_vpc_network.my_vpc_network.id
 master {
   master_location {
     zone      = yandex_vpc_subnet.zones.*.zone[count.index]
     subnet_id = yandex_vpc_subnet.zones.*.id[count.index]
   }
 }
 service_account_id      = yandex_iam_service_account.sa.id
 node_service_account_id = yandex_iam_service_account.sa.id
   depends_on = [
     yandex_resourcemanager_folder_iam_member.sa-editor,
     yandex_resourcemanager_folder_iam_member.images-puller
   ]
}
