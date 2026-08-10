rg-value = {
  rg1 = {
    name     = "Ahir"
    location = "East Asia"
  }
    name     = "Ahir"
    location = "East Asia"
  }

vnet-value = {
  vnet1 = {
    name                = "spoke-vnet"
    location            = "eastasia"
    resource_group_name = "Ahir"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "hub-vnet"
    location            = "Eastasia"
    resource_group_name = "Ahir"
    address_space       = ["10.1.0.0/16"]
  }
}


peerings-value = {
  peer-hub-to-spoke = {
    name                                       = "peer-hub-to-spoke"
    resource_group_name                        = "Ahir"
    virtual_network_name                       = "hub-vnet"
    remote_virtual_network_name                = "spoke-vnet"
    remote_virtual_network_resource_group_name = "Ahir"
  }
  peer-hub-to-spoke = {
    name                                       = "peer-spoke-to-hub"
    resource_group_name                        = "Ahir"
    virtual_network_name                       = "spoke-vnet"
    remote_virtual_network_name                = "hub-vnet"
    remote_virtual_network_resource_group_name = "Ahir"
  }
}



subnet-value = {
  frontend-snet = {
    name                 = "frontend-snet"
    virtual_network_name = "spoke-vnet"
    resource_group_name  = "Ahir"
    address_prefixes     = ["10.0.0.0/24"]
  }
  backend-snet = {
    name                 = "backend-snet"
    virtual_network_name = "spoke-vnet"
    resource_group_name  = "Ahir"
    address_prefixes     = ["10.0.1.0/24"]
  }
  database-snet = {
    name                 = "database-snet"
    virtual_network_name = "spoke-vnet"
    resource_group_name  = "Ahir"
    address_prefixes     = ["10.0.2.0/24"]
  }
  azure_bastion_subnet = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "hub-vnet"
    resource_group_name  = "Ahir"
    address_prefixes     = ["10.1.0.0/24"]
  }
}


Pip-value = {
  Pip-Bastion = {
    name                = "Pip-Bastion"
    location            = "Eastasia"
    resource_group_name = "Ahir"
    allocation_method   = "Static"
    ip_version          = "IPv4"
  }
}


Bastion-value = {
  bastion-1 = {
    name                 = "azure_bastion"
    location             = "eastasia"
    resource_group_name  = "Ahir"
    virtual_network_name = "hub-vnet"
    ipconfig_name        = "babu-ipconfig"
    subnet_name          = "AzureBastionSubnet"
    pip_name             = "Pip-Bastion"
  }
}



VM-value = {
  frontend_VM = {
    name                 = "frontend_VM"
    location             = "eastasia"
    resource_group_name  = "Ahir"
    admin_username       = "linux-vm"
    admin_password       = "@linux-vm1"
    size                 = "Standard_D2s_v3"
    virtual_network_name = "spoke-vnet"
    pip_name             = "pip-nic"
    subnet_name          = "frontend-snet"
    nic-ip-config-name   = "frontend-nic-ip"
    nic_name             = "frontend-nic"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "Ubuntu_Server"
    sku                  = "24.04 LTS"
    version              = "latest"
  }
  Backend_VM = {
    name                 = "Backend_VM"
    location             = "eastasia"
    resource_group_name  = "Ahir"
    admin_username       = "linux-vm"
    admin_password       = "@linux-vm1"
    size                 = "Standard_D2s_v3"
    virtual_network_name = "spoke-vnet"
    pip_name             = "pip-nic"
    subnet_name          = "backend-snet"
    nic-ip-config-name   = "Backend-nic-ip"
    nic_name             = "backend-nic"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "Ubuntu_Server"
    sku                  = "24.04 LTS"
    version              = "latest"
  }
  Database_VM = {
    name                 = "Database_VM"
    location             = "eastasia"
    resource_group_name  = "Ahir"
    admin_username       = "linux-vm"
    admin_password       = "@linux-vm1"
    size                 = "Standard_D2s_v3"
    virtual_network_name = "spoke-vnet"
    subnet_name          = "database-snet"
    nic-ip-config-name   = "Databse-nic-ip"
    nic_name             = "database-nic"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "Ubuntu_Server"
    sku                  = "24.04 LTS"
    version              = "latest"
  }
}

