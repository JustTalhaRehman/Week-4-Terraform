# Dev environment variables
prefix              = "lab"
environment         = "dev"
location            = "eastus"
resource_group_name = "rg-terraform-lab"

# VNet Config
vnet_name      = "vnet-lab"
address_space  = ["10.0.0.0/16"]
subnets = {
  aks-subnet   = "10.0.1.0/24"
  appgw-subnet = "10.0.2.0/24"
}

# AKS Config
aks_name        = "aks-lab"
dns_prefix      = "akslab"
aks_version     = "1.32.7"              # auto pick latest
node_pool_name  = "agentpool"
node_count      = 1
vm_size         = "Standard_B2s"
service_cidr    = "10.240.0.0/16"
dns_service_ip  = "10.240.0.10"
docker_bridge_cidr = "172.17.0.1/16"

# App Gateway Config
appgw_name          = "appgw-lab"
appgw_capacity      = 1
public_ip_name      = "pip-appgw-lab"
public_ip_allocation = "Static"
