# Beginner's Guide to Azure Verified Modules (AVM) Bicep Implementation

Azure Verified Modules (AVM) provide a standardized and reusable way to deploy Azure resources using Bicep. This guide will help you understand how to implement AVM using Bicep templates.

## What is AVM?

Azure Verified Modules are pre-built, reusable modules that simplify the deployment of Azure resources. They follow best practices and are verified by Microsoft to ensure reliability and security.

## Why Use AVM with Bicep?

- **Standardization**: AVM ensures consistent deployment practices.

- **Reusability**: Modules can be reused across multiple projects.

- **Simplified Management**: Reduces the complexity of managing Azure resources.

- **Best Practices**: AVM incorporates Azure's recommended practices.

## Prerequisites

Before you start implementing AVM with Bicep, ensure you have the following:

- **Azure CLI**: Installed and configured.

- **Bicep CLI**: Installed. You can install it using the Azure CLI:

  ```bash
  az bicep install
  ```

- **Code Editor**: Visual Studio Code with the Bicep extension is recommended.

- **Resource Group**: An Azure resource group where the resources will be deployed.

## Getting Started with AVM Bicep Implementation

### 1. Understand the AVM Structure

AVM modules are designed to be modular and reusable. Each module typically includes:

- **Main Bicep File**: Defines the resources to be deployed.

- **Parameters File**: Contains input parameters for the module.

- **Metadata**: Provides information about the module.

### 2. Clone the AVM Repository

If you are using AVM modules from a repository, clone it to your local machine:

```bash
git clone <repository-url>
```

### 3. Customize the Parameters

Modify the parameters file to suit your deployment needs. For example:

```json
{
  "location": "East US",
  "resourceName": "myResource",
  "tags": {
    "environment": "dev"
  }
}
```

### 4. Deploy the Module

Use the Azure CLI to deploy the module:

```bash
az deployment group create --resource-group <resource-group-name> --template-file <path-to-main-bicep-file> --parameters <path-to-parameters-file>
```

### 5. Validate the Deployment

Validate your deployment to ensure everything is configured correctly:

```bash
az deployment group validate --resource-group <resource-group-name> --template-file <path-to-main-bicep-file> --parameters <path-to-parameters-file>
```

## Referencing AVM Modules in Bicep

To use Azure Verified Modules (AVMs) in your Bicep templates, you need to reference them explicitly. Below are examples of how AVMs are referenced in the `main.bicep` file for deploying Azure Storage, Azure PostgreSQL, and Azure Container Apps.

### Azure Storage Module

```bicep
module storageAccount 'br/public:avm/ptn/storage/storage-account:1.3.0' = {
  name: 'storageAccountDeployment'
  params: {
    name: storageAccountName
    location: location
    sku: 'Standard_LRS'
    kind: 'StorageV2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: false
    minimumTlsVersion: 'TLS1_2'
    publicNetworkAccess: 'Disabled'
  }
}
```

### Azure PostgreSQL Module

```bicep
module postgreSqlServer 'br/public:avm/ptn/database/postgresql-server:1.4.0' = {
  name: 'postgreSqlServerDeployment'
  params: {
    name: postgreSqlServerName
    location: location
    sku: {
      name: 'GP_Gen5_2'
      tier: 'GeneralPurpose'
      capacity: 2
      family: 'Gen5'
    }
    administratorLogin: 'adminUser'
    administratorLoginPassword: 'securePassword123!'
    sslEnforcement: 'Enabled'
    publicNetworkAccess: 'Disabled'
  }
}
```

These module references ensure that your Bicep templates are aligned with Azure's best practices and leverage the power of AVMs for efficient and standardized deployments.

## Best Practices for AVM Bicep Implementation

- **Use Parameters**: Make your modules flexible by defining parameters.

- **Follow Naming Conventions**: Use consistent naming conventions for resources.

- **Leverage Outputs**: Use outputs to pass information between modules.

- **Test in Non-Production Environments**: Validate your modules in a test environment before deploying to production.

- **Version Control**: Store your modules in a version control system like Git.

## Resources

- [Azure Verified Modules Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/verified-modules/)

- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)

- [Azure CLI Documentation](https://learn.microsoft.com/en-us/cli/azure/)

By following this guide, you can effectively implement Azure Verified Modules using Bicep and streamline your Azure resource deployments.