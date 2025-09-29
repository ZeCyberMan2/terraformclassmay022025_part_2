variable "storage"{
  type= map(string)
  default= {
    "storage1" = "storage1"
    "storage2" = "storage2"
    "storage3" = "storage3"
    "storage4" = "storage4"
    "storage5" = "storage5"
  }
}

locals {
  storage_accounts=var.storage
}



resource "azurerm_resource_group" "account" {
  name     = "account-resources"
  location = "Canada Central"
}

resource "azurerm_storage_account" "storage-account" {
  name                     = "storageaccount"
  resource_group_name      = azurerm_resource_group.account.name
  location                 = azurerm_resource_group.account.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}


resource "azurerm_storage_account" "storages" {
  for_each= toset(local.storage_accounts)
  name= each.value
  resource_group_name= azurerm_resource_group.account.name
  location= azurerm_resource_group.account.location
  account_tier= each.value.account_tier
  account_replication_type= each.value.account_replication_type
  }
