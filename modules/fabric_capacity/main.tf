/**
 * # Fabric Capacity Module
 * 
 * This module creates a Microsoft Fabric Capacity resource in Azure using the AzureRM provider.
 * 
 * ## Usage
 * ```hcl
 * module "fabric_capacity" {
 *   source = "path/to/modules/fabric_capacity"
 *   
 *   name                = "example-capacity"
 *   resource_group_name = "example-rg"
 *   location            = "West Europe"
 *   sku_name            = "F2"
 *   
 *   administration_members = ["user@example.com"]
 *   
 *   tags = {
 *     Environment = "Development"
 *   }
 * }
 * ```
 */

# Get the current client configuration
data "azurerm_client_config" "current" {}

locals {
  admin_members = length(var.administration_members) > 0 ? var.administration_members : [data.azurerm_client_config.current.object_id]
}

# Create a Fabric Capacity
resource "azurerm_fabric_capacity" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  
  administration_members = local.admin_members

  sku {
    name = var.sku_name
    tier = "Fabric"
  }

  tags = var.tags
}
