variable "kubernetes2" {
  type = map(string)
  default = {
    "aks 1" = "aks 1"
    "aks 2" = "aks 2"
    "aks 3" = "aks 3"
    "aks 4" = "aks 4"
    "aks 5" = "aks 5"
  }
}

locals {
  aks_bundle = {
    for key, value in var.kubernetes2 :
    replace("mcit-${key}", " ", "-") => replace(value, " ", "-")
  }
}

resource "azurerm_kubernetes_cluster" "kubernities_aks" {
  for_each = local.aks_bundle
  name = each.key
  location = azurerm_resource_group.kubernetes-rg.location
  resource_group_name = azurerm_resource_group.kubernetes-rg.name
  dns_prefix = "aks"

  default_node_pool {
    name = "default"
    node_count = 1
    vm_size= "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
