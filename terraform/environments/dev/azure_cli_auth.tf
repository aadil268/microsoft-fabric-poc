# Test Environment Configuration for Azure CLI Authentication

terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.2.0"
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

provider "azuread" {
  # Azure CLI authentication is used by default
}

provider "fabric" {
  # Azure CLI authentication
  use_cli = true
}

# Variables
variable "solution_name" {
  description = "Name of the solution, used for resource naming"
  type        = string
  default     = "fabricpoc-cli"
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "West Europe"
}

# Include the AzureRM module for Fabric Capacity
module "fabric_capacity" {
  source = "../../modules/azurerm"
  
  solution_name      = var.solution_name
  location           = var.location
  fabric_capacity_sku = "F2"  # Using smallest SKU for testing
  
  tags = {
    Environment = "Test"
    AuthMethod  = "AzureCLI"
  }
}

# Output the Fabric Capacity details
output "fabric_capacity_id" {
  value = module.fabric_capacity.fabric_capacity_id
}

output "fabric_capacity_name" {
  value = module.fabric_capacity.fabric_capacity_name
}
