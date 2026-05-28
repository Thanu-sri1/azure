module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  vnet_name   = var.vnet_name
  subnet_name = var.subnet_name
  nsg_name    = var.nsg_name
}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  public_ip_name     = var.public_ip_name
  load_balancer_name = var.load_balancer_name
  backend_pool_name  = var.backend_pool_name

  probe_name   = var.probe_name
  lb_rule_name = var.lb_rule_name
}


module "vmss" {
  source = "./modules/vmss"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  vmss_name = var.vmss_name

  subnet_id = module.network.subnet_id

  backend_pool_id = module.loadbalancer.backend_pool_id

  admin_username = var.admin_username
  admin_password = var.admin_password
}

module "autoscale" {
  source = "./modules/autoscale"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  autoscale_name = var.autoscale_name

  vmss_id = module.vmss.vmss_id
}

module "monitoring" {
  source = "./modules/monitoring"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  log_analytics_name = var.log_analytics_name

  action_group_name = var.action_group_name

  cpu_alert_name = var.cpu_alert_name

  alert_email = var.alert_email

  vmss_id = module.vmss.vmss_id
}
