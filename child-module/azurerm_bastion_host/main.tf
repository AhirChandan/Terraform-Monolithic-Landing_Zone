resource "azurerm_bastion_host" "example" {
  for_each            = var.Bastions
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                 = each.value.ipconfig_name
    subnet_id            = data.azurerm_subnet.SUBNET[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

variable "Bastions" {}

