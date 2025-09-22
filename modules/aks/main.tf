# Fetch all supported AKS versions in your region
data "azurerm_kubernetes_service_versions" "aks_versions" {
  location = "eastus"   # use your AKS cluster region
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version = var.aks_version != "" ? var.aks_version : data.azurerm_kubernetes_service_versions.aks_versions.latest_version

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }


network_profile {
    network_plugin     = "azure"
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
    } 
}
