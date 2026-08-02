variable "RGs" {}

resource "azurerm_resource_group" "name" {
  for_each = var.RGs
  name     = each.value.name
  location = each.value.location
}

