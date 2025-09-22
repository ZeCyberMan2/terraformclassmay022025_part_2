variable "webapp_names" {
 type= list(string)
 default = var.location
}

resource "azurerm_resource_group" "mcitazurerm"{
  name= "Septemberazurerm"
  location= "Canada Central"
}

resource "azureerm_service_plan" "mcitsplan" {
  name= "mcitserviceplan"
  resource_group_name= azurerm_resource_group.mcitazurerm.name
  location= azurerm_resource_group.mcitazureerm.location
  os_type = "Linux"
  sku_name = var.pan_sku_name
}

resource "azurerm_linuxweb_app" "mcitlinuxwebapp"{
  for_each= toset(var.webapp_names)
  name= each.key
  resource_group_name= azurerm_resource_group.mcitazurerm.name
  location= azurerm_resource_group.mcitazurerm.location
  service_plan_id= azurerm_service_plan.mcitsplan.id

site_config{}
}
