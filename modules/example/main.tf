# Example usage of the Fabric modules

terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
    fabric = {
      source  = "microsoft/fabric"
      version = "1.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Azure CLI authentication is used by default
}

provider "fabric" {
  # Azure CLI authentication
  use_cli = true
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "fabric-modules-example-rg"
  location = "West Europe"
}

# Create a Fabric Capacity using the module
module "fabric_capacity" {
  source = "../fabric_capacity"
  
  name                = "example-capacity"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku_name            = "F2"
  
  tags = {
    Environment = "Test"
    Module      = "fabric_capacity"
  }
}

# Create a Fabric Workspace using the module
module "fabric_workspace" {
  source = "../fabric_workspace"
  
  capacity_id            = module.fabric_capacity.id
  display_name           = "example-workspace"
  description            = "Example Fabric workspace created via Terraform module"
  capacity_assignment_mode = "Shared"
}

# Output the created resources
output "capacity_id" {
  value = module.fabric_capacity.id
}

output "capacity_sku" {
  value = module.fabric_capacity.sku
}

output "workspace_id" {
  value = module.fabric_workspace.id
}

output "workspace_name" {
  value = module.fabric_workspace.display_name
}
