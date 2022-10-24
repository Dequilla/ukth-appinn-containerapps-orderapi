name=cavzprm

# Set variables for the rest of the lab
resourceGroup=${name}-rg
location=northeurope
containerAppEnv=${name}-env
logAnalytics=${name}-la
appInsights=${name}-ai
acr=${name}acr

storeURL=https://storeapp.$(az containerapp env show -g $resourceGroup -n $containerAppEnv --query 'properties.defaultDomain' -o tsv)/store

dataURL=https://httpapi.$(az containerapp env show -g $resourceGroup -n $containerAppEnv --query 'properties.defaultDomain' -o tsv)/data

dashboardURL=https://dashboardapp.$(az containerapp env show -g $resourceGroup -n $containerAppEnv --query 'properties.defaultDomain' -o tsv)


az ad sp create-for-rbac \
  --name github \
  --role "contributor" \
  --scopes /subscriptions/f7f71130-31e5-4f9d-aae5-2e464a1fb1a9/resourceGroups/cavzprm-rg \
  --sdk-auth

  {
  "clientId": "88720000-3c47-414f-810f-ab44441805cf",
  "clientSecret": "TQa8Q~-H0fUQH5B.kE8ozi8.YU44txxSBAjE6biv",
  "subscriptionId": "f7f71130-31e5-4f9d-aae5-2e464a1fb1a9",
  "tenantId": "f25493ae-1c98-41d7-8a33-0be75f5fe603",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}

spClientid=88720000-3c47-414f-810f-ab44441805cf
spClientSecret=TQa8Q~-H0fUQH5B.kE8ozi8.YU44txxSBAjE6biv
tenantid=f25493ae-1c98-41d7-8a33-0be75f5fe603

ghToken=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
repoUrl=https://github.com/dequilla/ukth-appinn-containerapps-orderapi

acrUrl=$(az acr show -n $acr -g $resourceGroup --query 'loginServer' -o tsv)
acrUsername=$(az acr show -n $acr -g $resourceGroup --query 'name' -o tsv)
acrSecret=$(az acr credential show -n $acr -g $resourceGroup --query passwords[0].value -o tsv)