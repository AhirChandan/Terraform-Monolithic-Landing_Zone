variable "VMs" {}


resource "azurerm_network_interface" "nic" {
  for_each            = var.VMs
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = each.value.nic-ip-config-name
    private_ip_address_allocation = "Static"
    subnet_id                     = data.azurerm_subnet.SUBNET[each.key].id
  }
}



resource "azurerm_linux_virtual_machine" "name" {
  depends_on = [ azurerm_network_interface.nic ]
  for_each                        = var.VMs
  name                            = each.value.name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  size                            = each.value.size
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic[each.key].id]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}


