locals {
  default_tags = {
    project     = var.project
    environment = var.environment
    location    = var.location
    terraform   = true
  }
}

resource "azurerm_resource_group" "rg_aks" {
  name     = var.resource_group_name
  location = var.location
  tags     = merge(var.tags, local.default_tags)
}


resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg_aks.location
  resource_group_name = azurerm_resource_group.rg_aks.name
  dns_prefix          = var.aks_cluster_name

  default_node_pool {
    name                  = "main"
    enable_auto_scaling   = true
    enable_node_public_ip = false
    node_taints           = []
    tags                  = {}
    node_count            = 1
    min_count             = 1
    max_count             = 10
    max_pods              = 120
    type                  = "VirtualMachineScaleSets"
    vm_size               = "Standard_DS2_v2"
    availability_zones    = ["1", "2", "3"]
    os_sku                = "Ubuntu"
    orchestrator_version  = var.kubernetes_version
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = var.kubernetes_version
  tags               = azurerm_resource_group.rg_aks.tags

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count
    ]
  }
}
