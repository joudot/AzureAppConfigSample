param location string = resourceGroup().location
param vaults_joudot_kv1_name string = 'joudot-kv1'
param vaults_joudot_kv2_name string = 'joudot-kv2'
param vaults_joudot_kv_prod_name string = 'joudot-kv-prod'
param configurationStores_joudot_app_config_name string = 'joudot-app-config'

resource configurationStores_joudot_app_config_name_resource 'Microsoft.AppConfiguration/configurationStores@2023-03-01' = {
  name: configurationStores_joudot_app_config_name
  location: location
  sku: {
    name: 'standard'
  }
  properties: {
    encryption: {
    }
    disableLocalAuth: false
    softDeleteRetentionInDays: 7
    enablePurgeProtection: false
  }
}

resource vaults_joudot_kv1_name_resource 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: vaults_joudot_kv1_name
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '8b67d136-9fca-42df-a844-84dd00e530da'
    accessPolicies: []
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: true
    vaultUri: 'https://${vaults_joudot_kv1_name}.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource vaults_joudot_kv2_name_resource 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: vaults_joudot_kv2_name
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '8b67d136-9fca-42df-a844-84dd00e530da'
    accessPolicies: []
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: true
    vaultUri: 'https://${vaults_joudot_kv2_name}.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource vaults_joudot_kv_prod_name_resource 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: vaults_joudot_kv_prod_name
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '8b67d136-9fca-42df-a844-84dd00e530da'
    accessPolicies: []
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: true
    vaultUri: 'https://${vaults_joudot_kv_prod_name}.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource vaults_joudot_kv1_name_secret1 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: vaults_joudot_kv1_name_resource
  name: 'secret1'
  properties: {
    contentType: 'Connection string'
    attributes: {
      enabled: true
    }
  }
}

resource vaults_joudot_kv_prod_name_secret1 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: vaults_joudot_kv_prod_name_resource
  name: 'secret1'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_joudot_kv2_name_secret2 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: vaults_joudot_kv2_name_resource
  name: 'secret2'
  properties: {
    contentType: 'Connection String'
    attributes: {
      enabled: true
    }
  }
}

resource vaults_joudot_kv_prod_name_secret2 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: vaults_joudot_kv_prod_name_resource
  name: 'secret2'
  properties: {
    attributes: {
      enabled: true
    }
  }
}
