output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "agw_subnet_id" {
  value = azurerm_subnet.agw_subnet.id
}

output "vm_subnet_id" {
  value = azurerm_subnet.vm_subnet.id
}