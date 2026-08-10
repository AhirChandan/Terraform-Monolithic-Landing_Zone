subnet = {
  snet1 = {
    name                 = "snet-1"
    virtual_network_name = "vnet-1"
    resource_group_name  = "Ahir"
    address_prefixes     = ["10.0.0.0/24"]
  }
  snet2 = {
    name                 = "snet-2"
    virtual_network_name = "vnet-2"
    resource_group_name  = "Chandan"
    address_prefixes     = ["10.1.0.0/24"]
  }
}   