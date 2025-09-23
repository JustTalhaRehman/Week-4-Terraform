# ./modules/vnet/variables.tf

# Name of the Virtual Network
variable "vnet_name" { type = string }

# List of address spaces for the VNet
variable "address_space" { type = list(string) }

# Map of subnets (key = name, value = CIDR)
variable "subnets" { type = map(string) }

# Region where VNet will be deployed
variable "location" { type = string }

# esource group for VNet
variable "resource_group_name" { type = string }
