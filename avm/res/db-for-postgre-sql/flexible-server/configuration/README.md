# DBforPostgreSQL Flexible Server Configurations `[Microsoft.DBforPostgreSQL/flexibleServers/configurations]`

This module deploys a DBforPostgreSQL Flexible Server Configuration.

## Navigation

- [Resource Types](#Resource-Types)
- [Parameters](#Parameters)
- [Outputs](#Outputs)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.DBforPostgreSQL/flexibleServers/configurations` | [2024-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DBforPostgreSQL/2024-08-01/flexibleServers/configurations) |

## Parameters

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-name) | string | The name of the configuration. |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`flexibleServerName`](#parameter-flexibleservername) | string | The name of the parent PostgreSQL flexible server. Required if the template is used in a standalone deployment. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`source`](#parameter-source) | string | Source of the configuration. |
| [`value`](#parameter-value) | string | Value of the configuration. |

### Parameter: `name`

The name of the configuration.

- Required: Yes
- Type: string

### Parameter: `flexibleServerName`

The name of the parent PostgreSQL flexible server. Required if the template is used in a standalone deployment.

- Required: Yes
- Type: string

### Parameter: `source`

Source of the configuration.

- Required: No
- Type: string

### Parameter: `value`

Value of the configuration.

- Required: No
- Type: string

## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the deployed configuration. |
| `resourceGroupName` | string | The resource group name of the deployed configuration. |
| `resourceId` | string | The resource ID of the deployed configuration. |
