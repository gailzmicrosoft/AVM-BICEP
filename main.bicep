// Resoure modules for Azure Container Apps and Storage Account

// need WAF aligned storage account 

module myStorageAccount 'br/public:avm/res/storage/storage-account:0.20.0' = {
  name: 'myStorageAccount'
  params: {
    name: 'mystorageaccount'
    location: 'eastus'
    kind: 'StorageV2'
    skuName:'Standard_LRS'
    accessTier: 'Hot'
    allowBlobPublicAccess: false 
  }
}

module resourceRoleAssignment 'br/public:avm/ptn/authorization/resource-role-assignment:0.1.2' = {
  name: 'resourceRoleAssignmentDeployment'
  params: {
    principalId: '<principalId>'
    resourceId: '<resourceId>'
    roleDefinitionId: '2a2b9908-6ea1-4ae2-8e65-a410df84e7d1'
    description: 'Assign Storage Blob Data Reader role to the managed identity on the storage account.'
    principalType: 'ServicePrincipal'
  }
}
