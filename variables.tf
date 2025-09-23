# Default location for all resources
variable "location" {
  description = "Default Azure location for all resources (can be overridden in tfvars)"
  default     = "eastus"
}

# Resource Group name where all resources will be deployed
variable "resource_group_name" {
  description = "Main resource group name"
  type        = string
  default     = "rg-terraform-lab"
}

# Environment name (used for naming & tagging resources)
variable "environment" {
  description = "Deployment environment (dev/stage/prod)"
  type        = string
  default     = "dev"
}

# APrefix Variable

# "Warning: Value for undeclared variable prefix"
variable "prefix" {
  description = "Prefix used for naming resources consistently (e.g. lab, stage, prod)"
  type        = string
}

# VNet Variables (Used in module "vnet")

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "List of address spaces for VNet"
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnet names and address prefixes"
  type        = map(string)
}

# -------------------------
# AKS Variables (Used in module "aks")
# -------------------------
variable "aks_name" {
  description = "Name of AKS Cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
}

variable "aks_version" {
  description = "AKS Kubernetes version (leave blank for latest)"
  type        = string
  default     = ""
}

variable "node_pool_name" {
  description = "Node pool name"
  type        = string
}

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
}

# ADDITION (NEW): Docker Bridge CIDR

# "Warning: Value for undeclared variable docker_bridge_cidr"
variable "docker_bridge_cidr" {
  description = "Docker bridge network CIDR for AKS (must not overlap with VNet)"
  type        = string
  default     = "172.17.0.1/16"
}

variable "service_cidr" {
  description = "AKS service CIDR"
  type        = string
  default     = "10.240.0.0/16"
}

variable "dns_service_ip" {
  description = "AKS DNS service IP"
  type        = string
  default     = "10.240.0.10"
}

# Application Gateway Variables (Used in module "appgw")

variable "appgw_name" {
  description = "Name of Application Gateway"
  type        = string
}

variable "public_ip_name" {
  description = "Public IP name for Application Gateway"
  type        = string
}

variable "appgw_sku_cap" {
  description = "Application Gateway capacity (instances)"
  type        = number
  default     = 1
}

# Public IP allocation method (Static)
variable "public_ip_allocation" {
  description = "Public IP allocation method for Application Gateway (Dynamic or Static)"
  type        = string
  default     = "Static"
}

# Application Gateway Capacity (alternative name to appgw_sku_cap for flexibility)
variable "appgw_capacity" {
  description = "App Gateway instance capacity (same as appgw_sku_cap if both provided)"
  type        = number
  default     = 1
}
