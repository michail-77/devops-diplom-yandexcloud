resource "yandex_kubernetes_cluster" "regional_cluster_resource_name" {
  count = length(var.cidr.stage)
  name        = "regional_cluster"
  description = "description"

 network_id = yandex_vpc_network.my_vpc_network.id

  master {
    regional {
      region = "ru-central1"

      location {
        zone = yandex_vpc_subnet.zones[count.index].zone
        subnet_id = yandex_vpc_subnet.zones[count.index].id
      }

      location {
        zone = yandex_vpc_subnet.zones[count.index].zone
        subnet_id = yandex_vpc_subnet.zones[count.index].id
      }

      location {
        zone = yandex_vpc_subnet.zones[count.index].zone
        subnet_id = yandex_vpc_subnet.zones[count.index].id
      }
    }

    version   = "1.14"
    public_ip = true

    maintenance_policy {
      auto_upgrade = true

      maintenance_window {
        day        = "monday"
        start_time = "15:00"
        duration   = "3h"
      }

      maintenance_window {
        day        = "friday"
        start_time = "10:00"
        duration   = "4h30m"
      }
    }
    
    master_logging {
      enabled = true
      folder_id = var.folder_id
      kube_apiserver_enabled = true
      cluster_autoscaler_enabled = true
      events_enabled = true
      audit_enabled = true
    }
  }

  service_account_id      = yandex_iam_service_account.sa.id
  node_service_account_id = yandex_iam_service_account.sa.id

}