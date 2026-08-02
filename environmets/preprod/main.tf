module "resource_group" {
  source = "../../child-module/azurerm_resource_group"
  RGs    = var.rg-value
}

module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../child-module/azurerm_virtual_network"
  Vnets      = var.vnet-value
}


module "peerings" {
  depends_on = [module.vnet]
  source     = "../../child-module/azurerm_peerings"
  peerings   = var.peerings-value
}


module "subnet" {
  depends_on = [module.vnet]
  source     = "../../child-module/azurerm_subnet"
  subnet     = var.subnet-value
}


module "Public_Ip" {
  depends_on = [module.resource_group]
  source     = "../../child-module/azurerm_public_ip"
  Public-ip  = var.Pip-value
}


module "Bastions" {
  depends_on = [module.vnet, module.resource_group, module.Public_Ip,module.subnet]
  source     = "../../child-module/azurerm_bastion_host"
  Bastions   = var.Bastion-value
}

/*
module "Linux_virtual_machine" {
  depends_on = [module.subnet, module.Public_Ip]
  source     = "../../child-module/azurerm_linux_virtual_machine"
  VMs        = var.VM-value
}



*/