module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  agw_subnet_name   = var.agw_subnet_name
  agw_subnet_prefix = var.agw_subnet_prefix

  vm_subnet_name   = var.vm_subnet_name
  vm_subnet_prefix = var.vm_subnet_prefix
}

module "security" {
  source = "./modules/security"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  vm_subnet_id = module.network.vm_subnet_id
}

module "compute" {
  source = "./modules/compute"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  vm_subnet_id = module.network.vm_subnet_id

  vm_size        = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password
}

module "application_gateway" {
  source = "./modules/application-gateway"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  agw_subnet_id = module.network.agw_subnet_id

  backend_ip_addresses = module.compute.backend_ip_addresses

  waf_mode = var.waf_mode

  domain_name = var.domain_name
}
