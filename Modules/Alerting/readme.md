# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing alerting profiles, connectivity alerts, and maintenance windows in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

## Table of Contents
- Introduction
- Requirements
- Providers
- Modules
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

## Modules
This module does not utilize any external modules.

## Resources
The following resources are created by this module:

- `dynatrace_alerting`
- `dynatrace_connectivity_alerts`
- `dynatrace_maintenance`

## Inputs
### Alerting Profile Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `alerting_name` | The name of the alerting profile, displayed in the UI | `string` | `"example_alerting_profile"` |
| `alerting_management_zone` | Entities which are part of the configured management zones will match this alerting profile. It is recommended to use manual tags instead. | `string` | `""` |
| `alerting_rule_1_tags` | Tags for rule 1 | `list(string)` | `["EnvironmentA:production", "Team:test"]` |
| `alerting_rule_1_delay_in_minutes` | Delay in minutes for rule 1 | `number` | `0` |
| `alerting_rule_1_severity_level` | Severity level for rule 1 | `string` | `"AVAILABILITY"` |
| `alerting_rule_2_tags` | Tags for rule 2 | `list(string)` | `["EnvironmentB:production", "Team:test"]` |
| `alerting_rule_2_delay_in_minutes` | Delay in minutes for rule 2 | `number` | `0` |
| `alerting_rule_2_severity_level` | Severity level for rule 2 | `string` | `"CUSTOM_ALERT"` |
| `alerting_rule_3_tags` | Tags for rule 3 | `list(string)` | `["EnvironmentC:production", "Team:test"]` |
| `alerting_rule_3_delay_in_minutes` | Delay in minutes for rule 3 | `number` | `0` |
| `alerting_rule_3_severity_level` | Severity level for rule 3 | `string` | `"ERRORS"` |
| `alerting_rule_4_tags` | Tags for rule 4 | `list(string)` | `["EnvironmentD:production", "Team:test"]` |
| `alerting_rule_4_delay_in_minutes` | Delay in minutes for rule 4 | `number` | `0` |
| `alerting_rule_4_severity_level` | Severity level for rule 4 | `string` | `"MONITORING_UNAVAILABLE"` |
| `alerting_rule_5_tags` | Tags for rule 5 | `list(string)` | `["EnvironmentE:production", "Team:test"]` |
| `alerting_rule_5_delay_in_minutes` | Delay in minutes for rule 5 | `number` | `0` |
| `alerting_rule_5_severity_level` | Severity level for rule 5 | `string` | `"PERFORMANCE"` |
| `alerting_rule_6_tags` | Tags for rule 6 | `list(string)` | `["EnvironmentF:production", "Team:test"]` |
| `alerting_rule_6_delay_in_minutes` | Delay in minutes for rule 6 | `number` | `0` |
| `alerting_rule_6_severity_level` | Severity level for rule 6 | `string` | `"RESOURCE_CONTENTION"` |

### Connectivity Alerts Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `connectivity_alerts` | TCP connectivity problems | `bool` | `false` |
| `process_group_id` | The scope of this setting | `string` | `"PROCESS_GROUP-1234567890000000"` |

### Maintenance Window Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `maintenance_enabled` | This setting is enabled (true) or disabled (false) | `bool` | `true` |
| `maintenance_name` | The name of the maintenance window, displayed in the UI | `string` | `"example_maintenance_window"` |
| `maintenance_description` | A short description of the maintenance purpose | `string` | `"Terraform test execution"` |
| `maintenance_type` | The type of the maintenance, possible values: PLANNED or UNPLANNED | `string` | `"PLANNED"` |
| `maintenance_disable_synthetic` | Disables the execution of the synthetic monitors that are within the scope of this maintenance window | `bool` | `true` |
| `maintenance_suppression` | The type of suppression of alerting and problem detection during the maintenance. Possible Values: DETECT_PROBLEMS_AND_ALERT, DETECT_PROBLEMS_DONT_ALERT, DONT_DETECT_PROBLEMS | `string` | `"DETECT_PROBLEMS_AND_ALERT"` |
| `maintenance_schedule_type` | The type maintenance window, possible values: DAILY, MONTHLY, ONCE, WEEKLY | `string` | `"WEEKLY"` |
| `maintenance_weekly_day_of_week` | The day of the week for weekly maintenance, possible values: FRIDAY, MONDAY, SATURDAY, SUNDAY, THURSDAY, TUESDAY, WEDNESDAY | `string` | `"MONDAY"` |
| `maintenance_weekly_end_date` | The end date of the recurrence range in YYYY-MM-DD format | `string` | `"2022-10-06"` |
| `maintenance_weekly_start_date` | The start date of the recurrence range in YYYY-MM-DD format | `string` | `"2022-10-05"` |
| `maintenance_weekly_end_time` | The end time of the maintenance window validity period in hh:mm:ss format | `string` | `"15:13:00"` |
| `maintenance_weekly_start_time` | The start time of the maintenance window validity period in hh:mm:ss format | `string` | `"14:13:00"` |
| `maintenance_weekly_time_zone` | The time zone of the start and end time. Default time zone is UTC. You can use either UTC offset UTC+01:00 format or the IANA Time Zone Database format (for example, Europe/Vienna) | `string` | `"UTC"` |
| `maintenance_filter_entity_type` | Type of entities this maintenance window should match. If no entity type is selected all entities regardless of the type will match. | `string` | `"HOST"` |
| `maintenance_filter_entity_tags` | Entities which contain all of the configured tags will match this maintenance window. | `list(string)` | `["KeyTest:ValueTest"]` |

## Outputs
| Name | Description |
|------|-------------|
| `alerting_id` | The ID of the alerting profile |
| `connectivity_alerts_id` | The ID of the connectivity alerts |
| `maintenance_id` | The ID of the maintenance window |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_alerting" {
  source = "./modules/alerting"

  alerting_name = var.alerting_name
  alerting_management_zone = var.alerting_management_zone
  alerting_rule_1_tags = var.alerting_rule_1_tags
  alerting_rule_1_delay_in_minutes = var.alerting_rule_1_delay_in_minutes
  alerting_rule_1_severity_level = var.alerting_rule_1_severity_level
  alerting_rule_2_tags = var.alerting_rule_2_tags
  alerting_rule_2_delay_in_minutes = var.alerting_rule_2_delay_in_minutes
  alerting_rule_2_severity_level = var.alerting_rule_2_severity_level
  alerting_rule_3_tags = var.alerting_rule_3_tags
  alerting_rule_3_delay_in_minutes = var.alerting_rule_3_delay_in_minutes
  alerting_rule_3_severity_level = var.alerting_rule_3_severity_level
  alerting_rule_4_tags = var.alerting_rule_4_tags
  alerting_rule_4_delay_in_minutes = var.alerting_rule_4_delay_in_minutes
  alerting_rule_4_severity_level = var.alerting_rule_4_severity_level
  alerting_rule_5_tags = var.alerting_rule_5_tags
  alerting_rule_5_delay_in_minutes = var.alerting_rule_5_delay_in_minutes
  alerting_rule_5_severity_level = var.alerting_rule_5_severity_level
  alerting_rule_6_tags = var.alerting_rule_6_tags
  alerting_rule_6_delay_in_minutes = var.alerting