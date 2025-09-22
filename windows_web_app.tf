variable "windowscountry" {
  type    = list(string)
  default = ["Canada", "China", "Singapour", "Haiti", "Russia"]
}

variable "plan_sku_name" {
  type    = string
  default = "B1"  # You can change to "P1v2", "S1", etc.
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "windowsazurerm" {
  name     = "SeptemberazurermWindows"
  location = "Canada Central"
}

resource "azurerm_service_plan" "windowsplan" {
  name                = "windowserviceplan"
  resource_group_name = azurerm_resource_group.windowsazurerm.name
  location            = azurerm_resource_group.windowsazurerm.location
  os_type             = "Windows"
  sku_name            = var.plan_sku_name
}

resource "azurerm_windows_web_app" "windowswebapp" {
  for_each = toset(var.windowscountry)

  name                = "webapp-${lower(each.key)}"
  resource_group_name = azurerm_resource_group.windowsazurerm.name
  location            = azurerm_resource_group.windowsazurerm.location
  service_plan_id     = azurerm_service_plan.windowsplan.id

  site_config {
    always_on = false
  }
}
