resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = var.vmss_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku = "Standard_DC1s_v3"

  instances = 2

  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  upgrade_mode = "Automatic"

  computer_name_prefix = "vmss"

  custom_data = base64encode(
    templatefile("${path.module}/cloud-init.tpl", {})
  )

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name    = "NIC-1"
    primary = true

    ip_configuration {
      name      = "IPCONFIG-1"
      primary   = true
      subnet_id = var.subnet_id

      load_balancer_backend_address_pool_ids = [
        var.backend_pool_id
      ]
    }
  }
}