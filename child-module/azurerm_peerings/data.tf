data "azurerm_virtual_network" "vnet" {
  for_each            = var.peerings
  name                = each.value.remote_virtual_network_name
  resource_group_name = each.value.remote_virtual_network_resource_group_name
}