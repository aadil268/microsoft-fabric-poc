# Integration and Comparison of Fabric and AzureRM Providers

## Provider Combination
Based on the GitHub example and documentation, the recommended approach is to use both providers together:

1. **AzureRM Provider**: Used to create and manage the Fabric Capacity resource in Azure
2. **Microsoft Fabric Provider**: Used to manage Fabric-specific resources like workspaces that use the capacity

## Authentication Comparison

| Feature | Fabric Provider | AzureRM Provider |
|---------|----------------|------------------|
| Managed Identity | Supported via `use_msi = true` | Supported via standard Azure authentication |
| Azure CLI | Supported via `use_cli = true` | Supported via standard Azure authentication |
| Service Principal | Limited support for some resources | Fully supported |
| User Context | Recommended for evaluation | Supported |

## Known Limitations and Workarounds

### Limitations
1. **Fabric Trial Capacity**: Not supported by either provider - only self-provisioned Fabric Capacity on Azure is supported
2. **Service Principal Support**: Limited for some Fabric resources
3. **Terraform Version**: Requires Terraform >= 1.8.x (>= 1.11.x preferred)

### Workarounds
1. For Service Principal limitations: Use Azure CLI authentication with User context as recommended in the documentation
2. For resource management: Use AzureRM provider for Fabric Capacity and Fabric provider for Fabric-specific resources
3. For authentication: Set up proper API permissions in the App Registration

## Best Practices
1. Use data sources to reference existing resources between providers
2. Implement proper state management for Terraform
3. Use lifecycle hooks to ensure resources are properly created before being referenced
4. Set up appropriate timeouts for resource creation and management
