Vnets = {
  vnet1 = {
    name                = "vnet-1"
    location            = "eastasia"
    resource_group_name = "Ahir"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "vnet-2"
    location            = "westus"
    resource_group_name = "Chandan"
    address_space       = ["10.1.0.0/16"]
  }
}
