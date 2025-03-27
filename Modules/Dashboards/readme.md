# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing JSON dashboards in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_json_dashboard`

## Inputs
### Dashboard Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `dashboard_name` | The name of the dashboard | `string` | `"Example Dashboard"` |
| `dashboard_shared` | Whether the dashboard is shared | `bool` | `true` |
| `dashboard_owner` | The owner of the dashboard | `string` | `"Dynatrace"` |
| `dashboard_tags` | Tags for the dashboard | `list(string)` | `["Example"]` |
| `dashboard_preset` | Whether the dashboard is a preset | `bool` | `false` |
| `metric_name` | The metric name for the custom chart | `string` | `"ext:cloud.azure.microsoft_cognitiveservices.accounts.successfulcalls"` |

## Outputs
| Name | Description |
|------|-------------|
| `dashboard_id` | The ID of the created dashboard |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_dashboard" {
  source = "./modules/dashboard"

  dashboard_name = var.dashboard_name
  dashboard_shared = var.dashboard_shared
  dashboard_owner = var.dashboard_owner
  dashboard_tags = var.dashboard_tags
  dashboard_preset = var.dashboard_preset
  metric_name = var.metric_name
}
```

