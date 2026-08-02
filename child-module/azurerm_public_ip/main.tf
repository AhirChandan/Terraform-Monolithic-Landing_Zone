variable "Public-ip" {}


resource "azurerm_public_ip" "example" {
  for_each            = var.Public-ip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  ip_version          = each.value.ip_version
}

