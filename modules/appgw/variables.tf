variable "appgw_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "subnet_id" { type = string }
variable "capacity" {
  type    = number
  default = 1
}
variable "public_ip_name" { type = string }
variable "public_ip_allocation" {
  type    = string
  default = "Static"
}