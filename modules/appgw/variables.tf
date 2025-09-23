# ./modules/appgw/variables.tf

# Application Gateway name
variable "appgw_name" { type = string }

# Azure region for AppGW
variable "location" { type = string }

# Resource group where AppGW will be deployed
variable "resource_group_name" { type = string }

# Subnet ID where AppGW will be placed (must be dedicated subnet)
variable "subnet_id" { type = string }

# Capacity (number of instances)
variable "capacity" {
  type    = number
  default = 1
}

# Public IP resource name
variable "public_ip_name" { type = string }

# Allocation method (Static or Dynamic)
variable "public_ip_allocation" {
  type    = string
  default = "Static"
}
