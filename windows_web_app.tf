variable "country1" {
  type= string
  default="Canada"
}

variable "activiti1" {
  type= string
  default="mapleleaf"
}


variable "activiti2" {
  type= string
  default="hockey"
}

variable "activiti3" {
  type= string
  default="poutine"
}

variable "activiti4" {
  type= string
  default="mountie"
}

variable "activiti5" {
  type= string
  default="niagara"
}

variable "activiti6" {
  type= string
  default="timhortons"
}


variable "activiti7" {
  type= string
  default="beavertail"
}

variable "activiti8" {
  type= string
  default="loonie"
}


variable "activiti9" {
  type= string
  default="canoe"
}

variable "activiti10" {
  type= string
  default="igloo"
}


variable "plan_sku_name2" {
  type= string
  default= "B1"  # You can change to "P1v2", "S1", etc.
}

variable "os_type2" {
  type= string
  default= "Windows" 
}


locals {
  windowscountry = {
    "wa-${var.country1}-${var.activiti1}" = {
      country = var.country1
      activity = var.activiti1
    }
  }
}



resource "azurerm_resource_group" "windowsazurerm" {
  name= "SeptemberazurermWindows"
  location= "Canada Central"
}

resource "azurerm_service_plan" "windowsplan" {
  name= "windowserviceplan"
  resource_group_name= azurerm_resource_group.windowsazurerm.name
  location= azurerm_resource_group.windowsazurerm.location
  os_type= var.os_type2
  sku_name= var.plan_sku_name2
}

resource "azurerm_windows_web_app" "windowswebapp" {
  for_each = loca.windowscountry
  name= each.key
  resource_group_name= azurerm_resource_group.windowsazurerm.name
  location= azurerm_resource_group.windowsazurerm.location
  service_plan_id= azurerm_service_plan.windowsplan.id

  site_config {}
}
