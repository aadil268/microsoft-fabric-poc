# AzureRM Provider Module for Microsoft Fabric Capacity

# Get the current client configuration
data "azurerm_client_config" "current" {}

# Create a resource group if not provided
resource "azurerm_resource_group" "this" {
  count    = var.resource_group_name == "" ? 1 : 0
  name     = "rg-${var.solution_name}"
  location = var.location
  tags     = var.tags
}

locals {
  resource_group_name = var.resource_group_name == "" ? azurerm_resource_group.this[0].name : var.resource_group_name
  admin_members       = length(var.admin_members) > 0 ? var.admin_members : [data.azurerm_client_config.current.object_id]
}

# Create a Fabric Capacity
resource "azurerm_fabric_capacity" "this" {
  name                = "fc-${var.solution_name}"
  resource_group_name = local.resource_group_name
  location            = var.location
  
  administration_members = local.admin_members

  sku {
    name = var.fabric_capacity_sku
    tier = "Fabric"
  }

  tags = var.tags
}
