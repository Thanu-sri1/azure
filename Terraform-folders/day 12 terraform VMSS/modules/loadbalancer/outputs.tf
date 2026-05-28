output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}

output "public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "load_balancer_id" {
  value = azurerm_lb.lb.id
}