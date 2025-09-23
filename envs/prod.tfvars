# Prod environment variables
prefix              = "lab"
environment         = "prod"
location            = "centralus"
resource_group_name = "rg-terraform-lab-prod"

# VNet Config
vnet_name      = "vnet-lab-prod"
address_space  = ["10.2.0.0/16"]
subnets = {
  aks-subnet   = "10.2.1.0/24"
  appgw-subnet = "10.2.2.0/24"
}

# AKS Config
aks_name        = "aks-lab-prod"
dns_prefix      = "akslabprod"
aks_version     = "1.32.7"              # auto pick latest
node_pool_name  = "agentpool"
node_count      = 3
vm_size         = "Standard_D2s_v3"
service_cidr    = "10.242.0.0/16"
dns_service_ip  = "10.242.0.10"
docker_bridge_cidr = "172.17.0.1/16"

# App Gateway Config
appgw_name          = "appgw-lab-prod"
appgw_capacity      = 2
public_ip_name      = "pip-appgw-prod"
public_ip_allocation = "Static"
