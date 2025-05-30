metadata name = 'Virtual Hub Routing Intent'
metadata description = 'This module configures Routing Intent for a Virtual Hub; this module requires an existing Virtual Hub, as well the firewall Resource ID.'

@description('Required. Hub firewall Resource ID.')
param azureFirewallResourceId string

@description('Optional. The name of the routing intent configuration.')
@allowed([
  'defaultRouteTable'
])
param name string = 'defaultRouteTable'

@description('Required. Name of the Virtual Hub.')
param virtualHubName string

@description('Optional. Configures Routing Intent to forward Private traffic to the firewall (RFC1918).')
param privateToFirewall bool = true

@description('Optional. Configures Routing Intent to Forward Internet traffic to the firewall (0.0.0.0/0).')
param internetToFirewall bool = true

resource virtualHub 'Microsoft.Network/virtualHubs@2022-11-01' existing = {
  name: virtualHubName
}

resource routingIntent 'Microsoft.Network/virtualHubs/routingIntent@2024-05-01' = {
  name: name
  parent: virtualHub
  properties: {
    routingPolicies: (internetToFirewall == true && privateToFirewall == true)
      ? [
          {
            name: '_policy_PublicTraffic'
            destinations: [
              'Internet'
            ]
            nextHop: azureFirewallResourceId
          }
          {
            name: '_policy_PrivateTraffic'
            destinations: [
              'PrivateTraffic'
            ]
            nextHop: azureFirewallResourceId
          }
        ]
      : (internetToFirewall == true && privateToFirewall == false)
          ? [
              {
                name: '_policy_PublicTraffic'
                destinations: [
                  'Internet'
                ]
                nextHop: azureFirewallResourceId
              }
            ]
          : (internetToFirewall == false && privateToFirewall == true)
              ? [
                  {
                    name: '_policy_PrivateTraffic'
                    destinations: [
                      'PrivateTraffic'
                    ]
                    nextHop: azureFirewallResourceId
                  }
                ]
              : null
  }
}

@description('The name of the Routing Intent configuration.')
output name string = routingIntent.name

@description('The resource ID of the Routing Intent configuration.')
output resourceId string = routingIntent.id

@description('The resource group the Routing Intent configuration was deployed into.')
output resourceGroupName string = resourceGroup().name
