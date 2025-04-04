# Fabric Modules Documentation

## Overview
This repository contains Terraform modules for deploying and managing Microsoft Fabric resources:
- `fabric_capacity`: Creates a Microsoft Fabric Capacity in Azure
- `fabric_workspace`: Creates a Microsoft Fabric Workspace associated with a Fabric Capacity

## Prerequisites
- Terraform >= 1.8.0
- Azure CLI installed and authenticated
- AzureRM provider 4.25.0 or later
- Microsoft Fabric provider 1.0.0 or later

## Module: fabric_capacity

### Description
This module creates a Microsoft Fabric Capacity resource in Azure using the AzureRM provider.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the Fabric Capacity | `string` | n/a | yes |
| resource_group_name | The name of the resource group in which to create the Fabric Capacity | `string` | n/a | yes |
| location | The Azure region where the Fabric Capacity should be created | `string` | n/a | yes |
| sku_name | The SKU name for the Fabric Capacity (F2, F4, F8, F16, F32, F64, F128, F256, F512, F1024, F2048) | `string` | n/a | yes |
| administration_members | List of administrator user identities (UPNs for users, object IDs for service principals) | `list(string)` | `[]` | no |
| tags | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Fabric Capacity |
| name | The name of the Fabric Capacity |
| resource_group_name | The name of the resource group containing the Fabric Capacity |
| location | The location of the Fabric Capacity |
| administration_members | The administrator members of the Fabric Capacity |
| sku | The SKU of the Fabric Capacity |

### Example Usage
```hcl
module "fabric_capacity" {
  source = "path/to/modules/fabric_capacity"
  
  name                = "example-capacity"
  resource_group_name = azurerm_resource_group.example.name
  location            = "West Europe"
  sku_name            = "F2"
  
  administration_members = ["user@example.com"]
  
  tags = {
    Environment = "Development"
  }
}
```

## Module: fabric_workspace

### Description
This module creates a Microsoft Fabric Workspace using the Microsoft Fabric provider.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| capacity_id | The ID of the Fabric Capacity to use for the workspace | `string` | n/a | yes |
| display_name | The display name of the Fabric workspace | `string` | n/a | yes |
| description | The description of the Fabric workspace | `string` | "Workspace created via Terraform" | no |
| capacity_assignment_mode | The capacity assignment mode for the workspace (Shared or Dedicated) | `string` | "Shared" | no |

### Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Fabric workspace |
| display_name | The display name of the Fabric workspace |
| description | The description of the Fabric workspace |
| capacity_id | The ID of the Fabric capacity used by the workspace |
| capacity_assignment_mode | The capacity assignment mode of the workspace |

### Example Usage
```hcl
module "fabric_workspace" {
  source = "path/to/modules/fabric_workspace"
  
  capacity_id            = module.fabric_capacity.id
  display_name           = "example-workspace"
  description            = "Example Fabric workspace"
  capacity_assignment_mode = "Shared"
}
```

## Complete Example
See the `example` directory for a complete example of using both modules together.

## Authentication
These modules support authentication via:
- Azure CLI (default)
- Managed Identity (by configuring the providers appropriately)

## Notes
- Microsoft Fabric trial capacity is not supported. Only self-provisioned Fabric Capacity on Azure is supported.
- The Fabric provider requires appropriate permissions to be set up in Azure.
