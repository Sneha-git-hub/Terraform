terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
    subscription_id="0c0998e3-a3fd-489c-834c-9032d0ecdc17"
    tenant_id="a71ee41b-37a4-4718-9bb5-9b35e217fcd0"
    client_id="07d50f85-a62b-4791-b30a-78cdfc44e15d"
    client_secret="oqI8Q~f1wjnJerPNXcnT3r7YOcIW42OttivNWcVQ"
   features{}
  # Configuration options
}

resource "azurerm_resource_group" "Terra_grp" {
  name     = "Terra_grp"
  location = "Canada Central"
}

resource "azurerm_storage_account" "storage4895612332" {
  name                     = "storage4895612332"
  resource_group_name      = "Terra_grp"
  location                 = "Canada Central"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.Terra_grp ]

}
resource "azurerm_storage_container" "cont1" {
  name                  = "cont1"
  storage_account_name  = "storage4895612332"
  container_access_type = "blob"
  depends_on = [ azurerm_storage_account.storage4895612332 ]
}
resource "azurerm_storage_blob" "blobex" {
  name                   = "blobex"
  storage_account_name   = "storage4895612332" 
  storage_container_name = "cont1"
  type                   = "Block"
  source                 = "main.tf"
  depends_on = [ azurerm_storage_container.cont1 ]
}