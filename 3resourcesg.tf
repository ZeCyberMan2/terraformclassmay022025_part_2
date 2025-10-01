variable "resourcesg" {
  default = ["test", "dev", "prod",]
 
}


resource "azurerm_resource_group" "groups"{
 for_each= var.resourcesg
  name= "rg-${each.key}"
  location= "Canada Central"
  resource_group_name= azurerm_resource_group.resourcesg.name
}


