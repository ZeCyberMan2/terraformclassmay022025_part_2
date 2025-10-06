resource "azurerm_resource_group" "kubernetes-rg" {
 name     = "kubernetes-resources"
 location = "Canada Central"
}
resource "azurerm_container_registry" "kubernetes-con" {
 name                = "containerKubernetes1"
 resource_group_name = azurerm_resource_group.kubernetes-rg.name
 location            = azurerm_resource_group.kubernetes-rg.location
 sku                 = "Premium"
}
resource "azurerm_kubernetes_cluster" "kubernetes-cluster" {
 name                = "kubernetes-aks1"
 location            = azurerm_resource_group.kubernetes-rg.location
 resource_group_name = azurerm_resource_group.kubernetes-rg.name
 dns_prefix          = "exampleaks1"
 default_node_pool {
   name       = "default"
   node_count = 1
   vm_size    = "Standard_D2_v2"
 }
 identity {
   type = "SystemAssigned"
 }
 tags = {
   Environment = "Production"
 }
}
resource "azurerm_role_assignment" "kubernetes-role" {
 principal_id                     = azurerm_kubernetes_cluster.kubernetes-cluster.kubelet_identity[0].object_id
 role_definition_name             = "AcrPull"
 scope                            = azurerm_container_registry.kubernetes-con.id
 skip_service_principal_aad_check = true
}
