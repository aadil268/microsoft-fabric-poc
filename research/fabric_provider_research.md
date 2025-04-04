# Microsoft Fabric Terraform Provider Research

## Provider Overview
The Microsoft Fabric Terraform Provider allows managing environments and other resources within Microsoft Fabric. It requires Terraform >= 1.8.x (>= 1.11.x preferred).

## Authentication Methods

### Managed Identity (MSI)
- Can be configured using `use_msi = true` in the provider block
- Requires proper setup of Microsoft Fabric to allow Service Principals
- Can use both System-Assigned and User-Assigned Managed Identities
- Requires appropriate API permissions to be set up

### Azure CLI
- Can be configured using `use_cli = true` in the provider block
- Requires Azure CLI to be installed and logged in
- Requires an App Registration for the User context
- Recommended for provider evaluation when Service Principal support is limited

## Known Limitations
1. **Capacity**: Microsoft Fabric trial capacity is not supported. Only self-provisioned Fabric Capacity on Azure is supported.
2. **Service Principal**: Not all Fabric resources support Service Principals yet. For provider evaluation, using Azure CLI for authentication with User context is recommended.

## Provider Configuration Example
```hcl
provider "fabric" {
  use_cli = true
}
```

## Resources Available
- `fabric_capacity` (via data source)
- `fabric_workspace`

## Integration with AzureRM Provider
The Microsoft Fabric provider works alongside the AzureRM provider, with AzureRM handling the Fabric Capacity creation and the Fabric provider managing Fabric-specific resources.
