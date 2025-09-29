resource "azurerm_resource_group" "account" {
  name     = "account-resources"
  location = "Canada Central"
}

resource "azurerm_storage_account" "storage-account" {
  name                     = "storage-account"
  resource_group_name      = azurerm_resource_group.account.name
  location                 = azurerm_resource_group.account.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

locals {
  storage_account_name = [
    "storage1",
    "storage2",
    "storage3",
    "storage4",
    "storage5"
  ]
}

resource "azurerm_storage_account" "storages" {
  for_each           = toset(local.storage_account_name)
  name               = each.value
  resource_group_name = azurerm_resource_group.account.name
  location           = azurerm_resource_group.account.location

  }
