output "vnet_id" {
  value = module.vnet.vnet_id
}

output "subnet_ids" {
  value = module.vnet.subnet_ids
}

output "aks_id" {
  value = module.aks.aks_id
}

output "aks_cluster_id" {
  value = module.aks.aks_cluster_id
}

output "aks_kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}

output "appgw_id" {
  value = module.appgw.appgw_id
}

output "appgw_public_ip" {
  value = module.appgw.appgw_public_ip
}