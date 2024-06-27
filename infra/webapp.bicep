param webAppName string = uniqueString(resourceGroup().id) // Generate unique String for web app name
param sku string = 'B1' // The SKU of App Service Plan
param location string = resourceGroup().location

var appServicePlanName = toLower('AppServicePlan-${webAppName}')

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'app'
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|16' // Specify Node.js version here
      appSettings: [
        {
          name: 'WEBSITE_NODE_DEFAULT_VERSION'
          value: '~16' // Ensure this matches the Node.js version above
        },
        {
          name: 'APPSETTING_ASPNETCORE_ENVIRONMENT' // Remove if not needed
          value: 'Development' // Remove if not needed
        },
        {
          name: 'APPSETTING_UseOnlyInMemoryDatabase' // Remove if not needed
          value: 'true' // Remove if not needed
        }
      ]
    }
  }
  kind: 'app'
}

output appId string = webApp.id
