data "azurerm_subnet" "SUBNET" {
  for_each             = var.Bastions
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.Bastions
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}



