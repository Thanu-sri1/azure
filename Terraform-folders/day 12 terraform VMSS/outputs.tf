output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_id" {
  value = module.network.subnet_id
}

# ---

output "public_ip" {
  value = module.loadbalancer.public_ip_address
}

output "backend_pool_id" {
  value = module.loadbalancer.backend_pool_id
}

# ---

output "vmss_name" {
  value = module.vmss.vmss_name
}

# ---

output "autoscale_name" {
  value = module.autoscale.autoscale_name
}

# ---

output "log_analytics_workspace_name" {
  value = module.monitoring.log_analytics_workspace_name
}

output "action_group_name" {
  value = module.monitoring.action_group_name
}