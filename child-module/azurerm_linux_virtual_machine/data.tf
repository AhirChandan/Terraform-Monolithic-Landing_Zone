data "azurerm_subnet" "SUBNET" {
  for_each             = var.VMs
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_network_interface" "nic" {
  for_each            = var.VMs
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

