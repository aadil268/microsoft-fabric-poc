# Microsoft Fabric Terraform Provider PoC

## Overview
This wiki page documents the Proof of Concept (PoC) for deploying Microsoft Fabric Cloud resources via Infrastructure as Code (IaC) using Terraform. The PoC evaluates both the Microsoft Fabric Terraform provider and the AzureRM provider for Fabric resources, comparing their capabilities, authentication methods, and limitations.

## Ticket Reference
**User Story**: Microsoft Fabric PoC

## Test Environment
- Terraform v1.11.3
- Microsoft Fabric Provider v1.0.0
- AzureRM Provider v4.25.0
- AzureAD Provider v3.2.0
- Authentication Methods: Azure CLI and Managed Identity

## Test Use Cases and Outcomes

### Test Case 1: Fabric Capacity Deployment via AzureRM Provider
**Objective**: Deploy Fabric Capacity using the AzureRM Terraform provider.

**Implementation**:
- Created a Terraform module for AzureRM provider
- Configured resource group and Fabric Capacity resources
- Implemented SKU selection with validation
- Added administrator member management

**Outcome**: ✅ Successful
- The AzureRM provider successfully deploys Fabric Capacity
- All required parameters (name, location, SKU) are configurable
- Administrator members can be specified or defaulted to current user
- Resource tagging is supported

### Test Case 2: Fabric Workspace Deployment via Fabric Provider
**Objective**: Deploy Fabric Workspace using the Microsoft Fabric Terraform provider.

**Implementation**:
- Created a Terraform module for Fabric provider
- Used data source to reference existing Fabric Capacity
- Implemented workspace creation with configurable parameters

**Outcome**: ✅ Successful
- The Fabric provider successfully creates workspaces
- Workspaces are properly linked to the Fabric Capacity
- Workspace properties (name, description) are configurable

### Test Case 3: Azure CLI Authentication
**Objective**: Test deployment using Azure CLI authentication.

**Implementation**:
- Configured providers to use Azure CLI authentication
- Created test environment configuration
- Tested with both AzureRM and Fabric providers

**Outcome**: ✅ Successful
- Azure CLI authentication works with both providers
- Simple to configure and use
- Recommended by Microsoft for Fabric provider evaluation
- Suitable for development and testing environments

### Test Case 4: Managed Identity Authentication
**Objective**: Test deployment using Managed Identity authentication.

**Implementation**:
- Configured providers to use Managed Identity authentication
- Created test environment configuration
- Tested with both AzureRM and Fabric providers

**Outcome**: ⚠️ Partially Successful
- Works well with AzureRM provider
- Limited support with Fabric provider (not all resources support Service Principals)
- Requires proper MSI setup on the deployment environment
- Better for automated deployments and CI/CD pipelines

## Authentication Method Comparison

| Feature | Azure CLI | Managed Identity |
|---------|-----------|-----------------|
| Ease of Setup | Simple | Moderate |
| Security | Moderate (user credentials) | High (no credentials stored) |
| Automation | Limited (requires manual login) | Excellent (works in CI/CD) |
| Support in AzureRM | Full support | Full support |
| Support in Fabric | Full support | Limited support |
| Recommended Use | Development, testing | Production, CI/CD pipelines |

## Known Limitations and Workarounds

### Microsoft Fabric Provider Limitations
1. **Trial Capacity Not Supported**
   - Only self-provisioned Fabric Capacity on Azure is supported
   - Use AzureRM provider to deploy Fabric Capacity

2. **Service Principal Support**
   - Not all Fabric resources support Service Principals yet
   - Use Azure CLI for authentication with User context

3. **Resource Dependency Management**
   - Use lifecycle hooks and depends_on to ensure proper resource creation order

### AzureRM Provider Limitations
1. **Limited Fabric Resource Types**
   - Only supports Fabric Capacity resources
   - Use Microsoft Fabric provider for other Fabric-specific resources

2. **SKU Limitations**
   - Only specific SKUs are supported for Fabric Capacity
   - Ensure you're using one of the supported SKUs

## Recommendations

1. **Provider Selection**
   - Use AzureRM provider for Fabric Capacity deployment
   - Use Microsoft Fabric provider for Fabric-specific resources (workspaces, etc.)
   - Combine both providers for complete Fabric resource management

2. **Authentication Strategy**
   - For development and testing: Use Azure CLI authentication
   - For production and CI/CD pipelines: Use Managed Identity where supported
   - Consider using a hybrid approach where necessary

3. **Module Structure**
   - Separate modules for AzureRM and Fabric providers
   - Clear dependency management between modules
   - Consistent variable naming and output structure

## Conclusion
Both the Microsoft Fabric Terraform provider and the AzureRM provider can be effectively used to deploy and manage Microsoft Fabric resources. The AzureRM provider is better suited for Fabric Capacity deployment, while the Microsoft Fabric provider is necessary for Fabric-specific resources. Authentication methods should be chosen based on the deployment environment and security requirements.

The PoC successfully demonstrates that Infrastructure as Code can be used to manage Microsoft Fabric resources, enabling automated deployment and consistent configuration across environments.
