terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.79.0"
    }
  }
  /*backend "azurerm" {
    resource_group_name  = "G160"
    storage_account_name = "b18g160"
    container_name       = "chandan"
    key                  = "module.tfstate"
  }*/
}

provider "azurerm" {
  features {}
}

