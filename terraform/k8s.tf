resource "azurerm_resource_group" "k8s_resource_group" {
  name     = var.resource_group_name 
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "jh-aks"
  location            = azurerm_resource_group.k8s_resource_group.location
  resource_group_name = azurerm_resource_group.k8s_resource_group.name
  dns_prefix          = "jh-aks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
