output "rg-id" {
  value = azurerm_resource_group.rg.id
}

output "vnet-id" {
  value = azurerm_virtual_network.vnet.id
}

output "public-subnet-id" {
  value = azurerm_subnet.public_subnet.id
}

output "private-subnet-id" {
  value = azurerm_subnet.private_subnet.id
}

output "public-nic-id" {
  value = azurerm_network_interface.public_nic.id
}

output "private-nic-id" {
  value = azurerm_network_interface.private_nic.id
}

output "private-ip" {
  value = azurerm_network_interface.private_nic.private_ip_address
}

output "public-ip" {
  value = azurerm_linux_virtual_machine.public_vm.public_ip_address
}

output "public-vm-id" {
  value = azurerm_linux_virtual_machine.public_vm.id
}

output "private-vm-id" {
  value = azurerm_linux_virtual_machine.private_vm.id
}
