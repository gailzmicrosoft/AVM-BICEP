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
