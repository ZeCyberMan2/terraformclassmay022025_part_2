#################################
# Variables
#################################
variable "canada_items2" {
  description = "Last-word items for Canada (Windows web apps)"
  type        = list(string)
  default = [
    "burger", "baseball", "jeans", "hollywood", "donut",
    "jazz", "applepie", "football", "route66", "hotdog"
  ]
}

#################################
# Resource Group (FIXED)
#################################
resource "azurerm_resource_group" "canada_us_rg" {
  name     = "canada-us-items-rg"
  location = "Canada Central"
}

#################################
# Windows Service Plan (FIXED)
#################################
resource "azurerm_service_plan" "windows_plan2" {
  name                = "mcit-windows-serviceplan"
  resource_group_name = azurerm_resource_group.canada_us_rg.name
  location            = azurerm_resource_group.canada_us_rg.location
  os_type             = "Windows"  # ✅ Changed from "Linux"
  sku_name            = "P1v2"
}

#################################
# Locals - convert list to map for for_each
#################################
locals {
  canada_items2_map = {
    for item in var.canada_items2 : item => item
  }
}

#################################
# Windows Web Apps (One per item)
#################################
resource "azurerm_windows_web_app" "us_apps2" {
  for_each            = local.canada_items2_map

  name                = "wa-canada-${each.key}"
  location            = azurerm_resource_group.canada_us_rg.location
  resource_group_name = azurerm_resource_group.canada_us_rg.name
  service_plan_id     = azurerm_service_plan.windows_plan2.id

  site_config {
    always_on = true
  }

  app_settings = {
    ITEM = each.key
  }

  tags = {
    environment = "dev"
    item        = each.key
    os          = "windows"
  }
}

# Output: List of app names
output "windows_web_app_names" {
  description = "Deployed Windows web app names"
  value = [
    for app in azurerm_windows_web_app.us_apps :
    app.name
  ]
}
