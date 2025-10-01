variable "resourcesg" {
  type=map(string)
  default = ["test", "dev", "prod",]
}


resource "azurerm_resource_group" "groups"{
 for_each= var.resourcesg
  name= "rg-${each.key}"
  location= "Canada Central"
}


