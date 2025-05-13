// Main Bicep file to deploy Azure Storage, Azure PostgreSQL, and Azure Container Apps
// using Azure Verified Modules (AVMs) aligned with the Azure Well-Architected Framework (WAF).

// Parameters
param location string = resourceGroup().location
param storageAccountName string
param postgreSqlServerName string
param containerAppName string

// Azure Storage Module
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

// Azure PostgreSQL Module
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

// Azure Container Apps Module
module containerApp 'br/public:avm/ptn/compute/container-app:1.5.0' = {
  name: 'containerAppDeployment'
  params: {
    name: containerAppName
    location: location
    managedEnvironmentId: '<container-app-environment-id>'
    configuration: {
      ingress: {
        external: false
        targetPort: 80
        transport: 'Auto'
      }
    }
    template: {
      containers: [
        {
          name: 'app-container'
          image: '<acr-name>.azurecr.io/<image-name>:<version>'
          resources: {
            cpu: 0.5
            memory: '1Gi'
          }
        }
      ]
    }
  }
}
