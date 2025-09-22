variable "location" {
  default = "eastus"
}

variable "resource_group_name" {
  default = "rg-terraform-lab"
  type = string
}

variable "environment" {
  type = string
  default = "dev"
}
