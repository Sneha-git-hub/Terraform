terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
    subscription_id=""
    tenant_id=""
    client_id=""
    client_secret=""
   features{}
  # Configuration options
}

resource "azurerm_resource_group" "Terra_grp" {
  name     = "Terra_grp"
  location = "Canada Central"
}

resource "azurerm_virtual_network" "virtualnet" {
  name                = "virtualnet"
  address_space       = ["10.0.0.0/16"]
  location            = "Canada Central"
  resource_group_name = "Terra_grp" 
}

