# Dynatrace Terraform Module

## Introduction
This Terraform module manages Dynatrace resources for ActiveGate updates, OneAgent updates, and update windows. It includes configurations for these resources along with necessary variables and outputs.

## Table of Contents
- Dynatrace Terraform Module
  - Table of Contents
  - Usage
  - Requirements
  - Providers
  - Resources
  - Inputs
  - Outputs
  - Example

## Usage
To use this module, include it in your Terraform configuration and provide the necessary variables. Below is an example of how to use this module:
```hcl
module "dynatrace_updates" {
  source = "./path_to_module"
  auto_update = var.auto_update
  scope_activegate = var.scope_activegate
  scope_oneagent = var.scope_oneagent
  target_version = var.target_version
  update_mode = var.update_mode
  name = var.name
  enabled = var.enabled
  recurrence = var.recurrence
  once_recurrence_end = var.once_recurrence_end
  once_recurrence_start = var.once_recurrence_start
}
```

## Requirements
- Terraform >= 0.12
- Dynatrace provider >= 1.0

## Providers
The module requires the following provider:

```hcl
terraform {
  required_providers {
    dynatrace = {
      source  = "dynatrace-oss/dynatrace"
      version = "~> 1.0"
    }
  }
}
```

## Resources
The following resources are created by this module:

- `dynatrace_activegate_updates`
- `dynatrace_oneagent_updates`
- `dynatrace_update_windows`

## Inputs
### Dashboard Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `auto_update` | Automatic updates at earliest convenience | `bool` | `true` |
| `scope_activegate` | The scope of this setting (ENVIRONMENT_ACTIVE_GATE). Omit this property if you want to cover the whole environment. | `string` | `"environment"` |
| `scope_oneagent` | The scope of this setting (HOST, HOST_GROUP). Omit this property if you want to cover the whole environment. | `string` | `"environment"` |
| `target_version` | Target version | `string` | `"latest"` |
| `update_mode` | Update mode | `string` | `"AUTOMATIC"` |
| `name` | Name | `string` | |
| `enabled` | This setting is enabled (true) or disabled (false) | `bool` | `true` |
| `recurrence` | Recurrence type | `string` | `"ONCE"` |
| `once_recurrence_end` | End time for once recurrence | `string` | |
| `once_recurrence_start` | Start time for once recurrence | `string` | |

## Outputs
| Name | Description |
|------|-------------|
| `activegate_updates_id` | The ID of the ActiveGate updates resource |
| `oneagent_updates_id` | The ID of the OneAgent updates resource |
| `update_windows_id` | The ID of the update windows resource |

## Example
```hcl
module "dynatrace_updates" {
  source = "./path_to_module"
  auto_update = true
  scope_activegate = "environment"
  scope_oneagent = "environment"
  target_version = "latest"
  update_mode = "AUTOMATIC"
  name = "example"
  enabled = true
  recurrence = "ONCE"
  once_recurrence_end = "2023-02-15T04:00:00Z"
  once_recurrence_start = "2023-02-15T02:00:00Z"
}
```

## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace resources.

