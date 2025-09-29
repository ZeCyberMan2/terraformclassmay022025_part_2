variable "storage"{
  type= map
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

variable "storage_settings"{
  default = {
    account_tier= "Standard"
    account_replication_type="GRS"
    environment="staging"
  }
}


resource "azurerm_storage_account" "storages" {
  for_each= local.storage_accounts
  name= each.value
  account_tier= var.storage_setting.account_tier
  account_replication_type= var.storage_setting.account_replication_type
  resource_group_name= azurerm_resource_group.account.name
  location= azurerm_resource_group.account.location
  }
