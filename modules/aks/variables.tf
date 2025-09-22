variable "aks_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "dns_prefix" { type = string }
variable "node_pool_name" { type = string }
variable "node_count" {
  type    = number
  default = 1
}
variable "vm_size" { type = string }
variable "subnet_id" { type = string }
variable "aks_version" {
  description = "Kubernetes version for AKS. Leave empty to automatically use latest supported version."
  type        = string
  default     = ""   # Empty means auto-pick
}
variable "service_cidr" {
  description = "AKS service CIDR"
  type        = string
  default     = "10.240.0.0/16"  # make sure it does not overlap your VNet subnets
}

variable "dns_service_ip" {
  description = "AKS DNS service IP"
  type        = string
  default     = "10.240.0.10"   # must be within service_cidr
}

variable "docker_bridge_cidr" {
  description = "Docker bridge network CIDR"
  type        = string
  default     = "172.17.0.1/16"
}
