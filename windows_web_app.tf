provider "azurerm"{
  features{}  
    subscription_id=var.subscription_id
    client_id=var.client_id
    client_secret=var.client_secret
    tenant_id=var.tenant_id
}
variable"windowscountry"{
  type = list(string)
  default = ["Canada", "China", "Singapour", "Haiti", "Russia"]
}

resource "azurerm_resource_group" "windowsazurerm"{
  name= "SeptemberazurermWindows"
  location= "Canada Central"
}

resource "windows_service_plan" "windowsplan"{
  name="windowserviceplan"
  resource_group_name= azurerm_resource_group.mcitazurerm.name
  location= azurerm_resource_group.mcitazurerm.location
  os_type="Windows"
  sku_name="B1"
}

resource "azurerm_windows_web_app" "windowswebapp" {
  for_each= toset(var.windowscountry)
  name= each.key
  resource_group_name= azurerm_resource_group.mcitazurerm.name
  location= azurerm_resource_group.mcitazurerm.location
  service_plan_id= azurerm_service_plan.mcitsplan.id

  site_config {}
}
