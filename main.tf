# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-lab"
  location = "eastus"
}

# VNet Module
module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = "vnet-lab"
  address_space       = ["10.0.0.0/16"]
  subnets = {
    "aks-subnet"   = "10.0.1.0/24",
    "appgw-subnet" = "10.0.2.0/24"
  }
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# AKS Module
module "aks" {
  source              = "./modules/aks"
  aks_name            = "aks-lab"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akslab"
  aks_version = "" 
  node_pool_name      = "agentpool"
  node_count          = 1               # minimal to save cost
  vm_size             = "Standard_B2s"  # free-tier compatible
  subnet_id           = module.vnet.subnet_ids["aks-subnet"]
  service_cidr        = "10.240.0.0/16"
  dns_service_ip      = "10.240.0.10"
}

# App Gateway Module
module "appgw" {
  source              = "./modules/appgw"
  appgw_name          = "appgw-lab"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.vnet.subnet_ids["appgw-subnet"]
  public_ip_name      = "pip-appgw-lab"
  capacity            = 1               # minimal to save cost
}
