
# Resource Group

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name  # Comes from variables.tf & dev.tfvars/prod.tfvars
  location = var.location             # Comes from variables.tf & dev.tfvars/prod.tfvars
}


# VNet Module

module "vnet" {
  source              = "./modules/vnet"

  # Using variables instead of hardcoded values
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnets             = var.subnets

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}


# AKS Module

module "aks" {
  source              = "./modules/aks"

  aks_name            = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  aks_version         = var.aks_version

  node_pool_name      = var.node_pool_name
  node_count          = var.node_count
  vm_size             = var.vm_size

  subnet_id           = module.vnet.subnet_ids["aks-subnet"]
  service_cidr        = var.service_cidr
  dns_service_ip      = var.dns_service_ip
}


# Application Gateway Module

module "appgw" {
  source              = "./modules/appgw"

  appgw_name          = var.appgw_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  subnet_id           = module.vnet.subnet_ids["appgw-subnet"]
  public_ip_name      = var.public_ip_name
  capacity            = var.appgw_sku_cap
}
