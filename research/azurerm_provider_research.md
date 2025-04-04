# AzureRM Fabric Capacity Provider Research

## Provider Overview
The AzureRM Terraform Provider includes resources for managing Microsoft Fabric Capacity in Azure. It's part of the standard AzureRM provider (version 4.25.0 and above).

## Authentication Methods
AzureRM provider supports multiple authentication methods:

### Managed Identity (MSI)
- Can be used by setting environment variables or provider configuration
- Works with both System-Assigned and User-Assigned Managed Identities
- Requires appropriate RBAC permissions on Azure resources

### Azure CLI
- Uses credentials from the Azure CLI session
- Simple to configure and use for development environments
- Requires Azure CLI to be installed and logged in

## Fabric Capacity Resource
The `azurerm_fabric_capacity` resource allows you to:
- Create and manage Fabric Capacity in Azure
- Configure SKU size and tier
- Manage administration members
- Apply tags for resource organization

## Resource Configuration Example
```hcl
resource "azurerm_fabric_capacity" "example" {
  name                = "example-ffc"
  resource_group_name = azurerm_resource_group.example.name
  location            = "West Europe"

  administration_members = [data.azurerm_client_config.current.object_id]

  sku {
    name = "F32"
    tier = "Fabric"
  }

  tags = {
    environment = "test"
  }
}
```

## SKU Options
Available SKU names for Fabric Capacity:
- F2, F4, F8, F16, F32, F64, F128, F256, F512, F1024, F2048
- The only supported tier is "Fabric"

## Integration with Fabric Provider
The AzureRM provider handles the Fabric Capacity creation, while the Microsoft Fabric provider can be used to manage Fabric-specific resources that use the capacity.
