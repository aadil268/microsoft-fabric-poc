# Microsoft Fabric Terraform Providers: Limitations and Workarounds

## Known Limitations

### Microsoft Fabric Provider Limitations

1. **Trial Capacity Not Supported**
   - **Limitation**: Microsoft Fabric trial capacity is not supported by the Fabric Terraform provider.
   - **Workaround**: Use self-provisioned Fabric Capacity on Azure through the AzureRM provider.

2. **Service Principal Support**
   - **Limitation**: Not all Fabric resources support Service Principals yet.
   - **Workaround**: Use Azure CLI for authentication with User context as recommended in the documentation.

3. **Terraform Version Requirements**
   - **Limitation**: Requires Terraform >= 1.8.x (>= 1.11.x preferred).
   - **Workaround**: Ensure your deployment environment uses a compatible Terraform version.

4. **Resource Dependency Management**
   - **Limitation**: Fabric resources often have dependencies that must be properly managed.
   - **Workaround**: Use lifecycle hooks and depends_on to ensure resources are properly created before being referenced.

### AzureRM Provider Limitations for Fabric Resources

1. **Limited Fabric Resource Types**
   - **Limitation**: The AzureRM provider only supports Fabric Capacity resources, not other Fabric-specific resources.
   - **Workaround**: Use the Microsoft Fabric provider alongside AzureRM for managing Fabric-specific resources.

2. **SKU Limitations**
   - **Limitation**: Only specific SKUs are supported for Fabric Capacity.
   - **Workaround**: Ensure you're using one of the supported SKUs (F2, F4, F8, F16, F32, F64, F128, F256, F512, F1024, F2048).

## Integration Challenges and Workarounds

1. **Cross-Provider Resource References**
   - **Challenge**: Referencing resources between the AzureRM and Fabric providers can be complex.
   - **Workaround**: Use data sources to query existing resources and pass IDs between modules.

2. **Authentication Method Consistency**
   - **Challenge**: Different authentication methods may be required for different providers.
   - **Workaround**: Consider using a hybrid approach - AzureRM with MSI for automated pipelines, and Fabric with CLI for resources that don't support MSI.

3. **State Management**
   - **Challenge**: Managing state across multiple providers can be complex.
   - **Workaround**: Use a remote state backend and proper workspace management to ensure consistent state tracking.

## Best Practices and Recommendations

1. **Authentication Strategy**
   - For development and testing: Use Azure CLI authentication
   - For production and CI/CD pipelines: Use Managed Identity where supported
   - Consider using a combination approach where necessary

2. **Module Structure**
   - Separate modules for AzureRM and Fabric providers
   - Clear dependency management between modules
   - Consistent variable naming and output structure

3. **Testing and Validation**
   - Test both authentication methods in isolation
   - Validate resource creation and dependencies
   - Implement proper error handling and retry logic

4. **Documentation**
   - Document authentication requirements clearly
   - Provide examples for both authentication methods
   - Include troubleshooting guidance for common issues
