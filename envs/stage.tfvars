# Stage environment variables
prefix              = "lab"
environment         = "stage"
location            = "eastus2"
resource_group_name = "rg-terraform-lab-stage"

# VNet Config
vnet_name      = "vnet-lab-stage"
address_space  = ["10.1.0.0/16"]
subnets = {
  aks-subnet   = "10.1.1.0/24"
  appgw-subnet = "10.1.2.0/24"
}

# AKS Config
aks_name        = "aks-lab-stage"
dns_prefix      = "akslabstage"
aks_version     = "1.32.7"              # auto pick latest
node_pool_name  = "agentpool"
node_count      = 2
vm_size         = "Standard_B2s"
service_cidr    = "10.241.0.0/16"
dns_service_ip  = "10.241.0.10"
docker_bridge_cidr = "172.17.0.1/16"

# App Gateway Config
appgw_name          = "appgw-lab-stage"
appgw_capacity      = 1
public_ip_name      = "pip-appgw-stage"
public_ip_allocation = "Static"
