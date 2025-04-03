# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing process monitoring configurations in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

## Table of Contents
- Introduction
- Requirements
- Providers
- Resources
- Inputs
- Outputs
- Usage


## Requirements
- Terraform >= 0.12
- Dynatrace account

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

- `dynatrace_builtin_process_monitoring`
- `dynatrace_process_availability`
- `dynatrace_process_monitoring`
- `dynatrace_process_monitoring_rule`
- `dynatrace_process_visibility`

## Inputs
### Built-in Process Monitoring Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `host_group_id` | The ID of the host group | `string` | `"environment"` |
| `aspnetcore` | Enable ASP.NET Core monitoring | `bool` | `false` |
| `cf_appsmanagerjs` | Enable Cloud Foundry Apps Manager JS monitoring | `bool` | `false` |
| `container` | Enable container monitoring | `bool` | `false` |
| `docker_pauseamd64` | Enable Docker pause AMD64 monitoring | `bool` | `false` |
| `exe_bbs` | Enable BBS executable monitoring | `bool` | `false` |
| `exe_caddy` | Enable Caddy executable monitoring | `bool` | `false` |
| `exe_schedular` | Enable scheduler executable monitoring | `bool` | `false` |
| `exe_silkdaemon` | Enable Silk Daemon executable monitoring | `bool` | `false` |
| `go_static` | Enable Go static monitoring | `bool` | `false` |
| `node_nodegyp` | Enable Node.js Node-Gyp monitoring | `bool` | `false` |

### Process Availability Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `process_availability_enabled` | Enable process availability monitoring | `bool` | `true` |
| `process_availability_name` | The name of the process availability rule | `string` | `"Process Availability Rule"` |
| `process_availability_rule_property` | The property for the process availability rule | `string` | `"executable"` |
| `process_availability_rule_condition` | The condition for the process availability rule | `string` | `"$contains(svc)"` |
| `process_availability_metadata_key` | The key for the process availability metadata | `string` | `"foo"` |
| `process_availability_metadata_value` | The value for the process availability metadata | `string` | `"bar"` |

### Process Monitoring Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `process_monitoring_host_group_id` | The ID of the host group for process monitoring | `string` | `"HOST_GROUP-0000000000000000"` |
| `process_monitoring_auto_monitoring` | Enable automatic process monitoring | `bool` | `true` |

### Process Monitoring Rule Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `process_monitoring_rule_enabled` | Enable the process monitoring rule | `bool` | `true` |
| `process_monitoring_rule_mode` | The mode for the process monitoring rule | `string` | `"MONITORING_OFF"` |
| `process_monitoring_rule_host_group_id` | The ID of the host group for the process monitoring rule | `string` | `"HOST_GROUP-0000000000000000"` |
| `process_monitoring_rule_condition_item` | The item for the process monitoring rule condition | `string` | `"APACHE_CONFIG_PATH"` |
| `process_monitoring_rule_condition_operator` | The operator for the process monitoring rule condition | `string` | `"STARTS"` |
| `process_monitoring_rule_condition_value` | The value for the process monitoring rule condition | `string` | `"foo-bar-x"` |

### Process Visibility Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `process_visibility_enabled` | Enable process visibility | `bool` | `true` |
| `process_visibility_max_processes` | The maximum number of processes for visibility | `number` | `80` |
| `process_visibility_scope` | The scope for process visibility | `string` | `"environment"` |

## Outputs
| Name | Description |
|------|-------------|
| `builtin_process_monitoring_id` | The ID of the built-in process monitoring configuration |
| `process_availability_id` | The ID of the process availability configuration |
| `process_monitoring_id` | The ID of the process monitoring configuration |
| `process_monitoring_rule_id` | The ID of the process monitoring rule |
| `process_visibility_id` | The ID of the process visibility configuration |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_builtin_process_monitoring" {
  source = "./modules/builtin_process_monitoring"

  host_group_id = var.host_group_id
  aspnetcore = var.aspnetcore
  cf_appsmanagerjs = var.cf_appsmanagerjs
  container = var.container
  docker_pauseamd64 = var.docker_pauseamd64
  exe_bbs = var.exe_bbs
  exe_caddy = var.exe_caddy
  exe_schedular = var.exe_schedular
  exe_silkdaemon = var.exe_silkdaemon
  go_static = var.go_static
  node_nodegyp = var.node_nodegyp
}

module "dynatrace_process_availability" {
  source = "./modules/process_availability"

  process_availability_enabled = var.process_availability_enabled
  process_availability_name = var.process_availability_name
  process_availability_rule_property = var.process_availability_rule_property
  process_availability_rule_condition = var.process_availability_rule_condition
  process_availability_metadata_key = var.process_availability_metadata_key
  process_availability_metadata_value = var.process_availability_metadata_value
}

module "dynatrace_process_monitoring" {
  source = "./modules/process_monitoring"

  process_monitoring_host_group_id = var.process_monitoring_host_group_id
  process_monitoring_auto_monitoring = var.process_monitoring_auto_monitoring
}

module "dynatrace_process_monitoring_rule" {
  source = "./modules/process_monitoring_rule"

  process_monitoring_rule_enabled = var.process_monitoring_rule_enabled
  process_monitoring_rule_mode = var.process_monitoring_rule_mode
  process_monitoring_rule_host_group_id = var.process_monitoring_rule_host_group_id
  process_monitoring_rule_condition_item = var.process_monitoring_rule_condition_item
  process_monitoring_rule_condition_operator = var.process_monitoring_rule_condition_operator
  process_monitoring_rule_condition_value = var.process_monitoring_rule_condition_value
}

module "dynatrace_process_visibility" {
  source = "./modules/process_visibility"

  process_visibility_enabled = var.process_visibility_enabled
  process_visibility_max_processes = var.process_visibility_max_processes
  process_visibility_scope = var.process_visibility_scope
}
```
## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace  resources.
