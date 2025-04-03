# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing network monitors in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_network_monitor`
- `dynatrace_network_monitor_outage`

## Inputs
### Network Monitor Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `network_monitor_name` | The name of the network monitor | `string` | `"DNS Test"` |
| `network_monitor_description` | The description of the network monitor | `string` | `"This is an example DNS test"` |
| `network_monitor_type` | The type of the network monitor | `string` | `"MULTI_PROTOCOL"` |
| `network_monitor_enabled` | Whether the network monitor is enabled | `bool` | `false` |
| `network_monitor_frequency_min` | The frequency of the network monitor in minutes | `number` | `15` |
| `network_monitor_locations` | The locations for the network monitor | `list(string)` | `["SYNTHETIC_LOCATION-39F97465BE7BF644"]` |
| `network_monitor_global_consecutive_outage_count_threshold` | The global consecutive outage count threshold | `number` | `1` |
| `network_monitor_global_outages` | Whether global outages are enabled | `bool` | `true` |
| `network_monitor_performance_thresholds_enabled` | Whether performance thresholds are enabled | `bool` | `true` |
| `network_monitor_threshold_aggregation` | The aggregation method for the threshold | `string` | `"AVG"` |
| `network_monitor_threshold_dealerting_samples` | The number of dealerting samples | `number` | `5` |
| `network_monitor_threshold_samples` | The number of samples | `number` | `5` |
| `network_monitor_threshold_step_index` | The step index for the threshold | `number` | `0` |
| `network_monitor_threshold_value` | The threshold value | `number` | `100` |
| `network_monitor_threshold_violating_samples` | The number of violating samples | `number` | `3` |
| `network_monitor_step_name` | The name of the network monitor step | `string` | `"DNS Test"` |
| `network_monitor_step_request_type` | The request type for the network monitor step | `string` | `"DNS"` |
| `network_monitor_step_target_list` | The target list for the network monitor step | `list(string)` | `["google.com", "yahoo.com"]` |
| `network_monitor_step_properties` | The properties for the network monitor step | `map(string)` | `{"DNS_RECORD_TYPES" = "A", "EXECUTION_TIMEOUT" = "PT2S"}` |
| `network_monitor_step_constraint_type` | The constraint type for the network monitor step | `string` | `"SUCCESS_RATE_PERCENT"` |
| `network_monitor_step_constraint_properties` | The constraint properties for the network monitor step | `map(string)` | `{"value" = "90", "operator" = ">="}` |
| `network_monitor_step_request_constraint_type` | The request constraint type for the network monitor step | `string` | `"DNS_STATUS_CODE"` |
| `network_monitor_step_request_constraint_properties` | The request constraint properties for the network monitor step | `map(string)` | `{"operator" = "=", "statusCode" = "0"}` |
| `network_monitor_tag_context` | The context for the network monitor tag | `string` | `"CONTEXTLESS"` |
| `network_monitor_tag_key` | The key for the network monitor tag | `string` | `"Key1"` |
| `network_monitor_tag_source` | The source for the network monitor tag | `string` | `"USER"` |
| `network_monitor_tag_value` | The value for the network monitor tag | `string` | `"Value1"` |

### Network Monitor Outage Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `network_monitor_outage_global_outages` | Whether global outages are enabled | `bool` | `true` |
| `network_monitor_outage_global_consecutive_outage_count_threshold` | The global consecutive outage count threshold | `number` | `5` |
| `network_monitor_outage_local_outages` | Whether local outages are enabled | `bool` | `true` |
| `network_monitor_outage_local_consecutive_outage_count_threshold` | The local consecutive outage count threshold | `number` | `3` |
| `network_monitor_outage_local_location_outage_count_threshold` | The local location outage count threshold | `number` | `1` |
| `network_monitor_outage_scope` | The scope for the network monitor outage | `string` | `"MULTIPROTOCOL_MONITOR"` |

## Outputs
| Name | Description |
|------|-------------|
| `network_monitor_id` | The ID of the network monitor |
| `network_monitor_outage_id` | The ID of the network monitor outage |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_network_monitor" {
  source = "./modules/network_monitor"

  network_monitor_name = var.network_monitor_name
  network_monitor_description = var.network_monitor_description
  network_monitor_type = var.network_monitor_type
  network_monitor_enabled = var.network_monitor_enabled
  network_monitor_frequency_min = var.network_monitor_frequency_min
  network_monitor_locations = var.network_monitor_locations
  network_monitor_global_consecutive_outage_count_threshold = var.network_monitor_global_consecutive_outage_count_threshold
  network_monitor_global_outages = var.network_monitor_global_outages
  network_monitor_performance_thresholds_enabled = var.network_monitor_performance_thresholds_enabled
  network_monitor_threshold_aggregation = var.network_monitor_threshold_aggregation
  network_monitor_threshold_dealerting_samples = var.network_monitor_threshold_dealerting_samples
  network_monitor_threshold_samples = var.network_monitor_threshold_samples
  network_monitor_threshold_step_index = var.network_monitor_threshold_step_index
  network_monitor_threshold_value = var.network_monitor_threshold_value
  network_monitor_threshold_violating_samples = var.network_monitor_threshold_violating_samples
  network_monitor_step_name = var.network_monitor_step_name
  network_monitor_step_request_type = var.network_monitor_step_request_type
  network_monitor_step_target_list = var.network_monitor_step_target_list
  network_monitor_step_properties = var.network_monitor_step_properties
  network_monitor_step_constraint_type = var.network_monitor_step_constraint_type
  network_monitor_step_constraint_properties = var.network_monitor_step_constraint_properties
  network_monitor_step_request_constraint_type = var.network_monitor_step_request_constraint_type
  network_monitor_step_request_constraint_properties = var.network_monitor_step_request_constraint_properties
  network_monitor_tag_context = var.network_monitor_tag_context
  network_monitor_tag_key = var.network_monitor_tag_key
  network_monitor_tag_source = var.network_monitor_tag_source
  network_monitor_tag_value = var.network_monitor_tag_value
}

module "dynatrace_network_monitor_outage" {
  source = "./modules/network_monitor_outage"

  network_monitor_outage_global_outages = var.network_monitor_outage_global_outages
  network_monitor_outage_global_consecutive_outage_count_threshold = var.network_monitor_outage_global_consecutive_outage_count_threshold
  network_monitor_outage_local_outages = var.network_monitor_outage_local_outages
  network_monitor_outage_local_consecutive_outage_count_threshold = var.network_monitor_outage_local_consecutive_outage_count_threshold
  network_monitor_outage_local_location_outage_count_threshold = var.network_monitor_outage_local_location_outage_count_threshold
  network_monitor_outage_scope = var.network_monitor_outage_scope
}
```
## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace  resources.
