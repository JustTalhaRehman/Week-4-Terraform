# ./modules/aks/variables.tf

# AKS Cluster Name
variable "aks_name" { type = string }

# Region where AKS cluster will be created
variable "location" { type = string }

# Resource group where AKS will live
variable "resource_group_name" { type = string }

# DNS prefix for AKS (used for cluster API FQDN)
variable "dns_prefix" { type = string }

# System node pool name
variable "node_pool_name" { type = string }

# Number of nodes in default node pool
variable "node_count" {
  type    = number
  default = 1
}

# VM Size for AKS nodes (Standard_B2s, Standard_D2s_v3, etc.)
variable "vm_size" { type = string }

# Subnet where AKS nodes will be deployed
variable "subnet_id" { type = string }

# (Optional) Kubernetes version. Leave empty for latest.
variable "aks_version" {
  description = "Kubernetes version for AKS. Leave empty to automatically use latest supported version."
  type        = string
  default     = ""
}

# Service CIDR (internal AKS services)
variable "service_cidr" {
  description = "AKS service CIDR (should not overlap with VNet subnets)"
  type        = string
  default     = "10.240.0.0/16"
}

# DNS service IP inside service CIDR
variable "dns_service_ip" {
  description = "AKS DNS service IP (must be inside service_cidr)"
  type        = string
  default     = "10.240.0.10"
}

# Docker bridge network
variable "docker_bridge_cidr" {
  description = "Docker bridge network CIDR"
  type        = string
  default     = "172.17.0.1/16"
}
