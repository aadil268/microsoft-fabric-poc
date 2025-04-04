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
  # For Azure CLI authentication, no additional configuration needed
  # For Managed Identity, uncomment the following:
  # use_msi = true
}

provider "azuread" {
  # No additional configuration needed for Azure CLI authentication
}

provider "fabric" {
  # For Azure CLI authentication
  use_cli = true
  
  # For Managed Identity, uncomment the following:
  # use_msi = true
}

# Include the modules
module "fabric_capacity" {
  source = "./modules/fabric_capacity"
  # Variables will be passed here
}

module "fabric_workspace" {
  source = "./modules/fabric_workspace"
  # Variables will be passed here
  # This depends on the fabric_capacity module
  depends_on = [module.fabric_capacity]
}
