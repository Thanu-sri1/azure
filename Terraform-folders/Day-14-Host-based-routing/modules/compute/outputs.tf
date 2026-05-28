output "backend_ip_addresses" {
  value = [
    azurerm_network_interface.nic1.private_ip_address,
    azurerm_network_interface.nic2.private_ip_address
  ]
}

output "vm1_private_ip" {
  value = azurerm_network_interface.nic1.private_ip_address
}

output "vm2_private_ip" {
  value = azurerm_network_interface.nic2.private_ip_address
}