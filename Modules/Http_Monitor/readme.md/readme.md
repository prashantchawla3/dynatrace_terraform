# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing HTTP monitors in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_http_monitor`

## Inputs
### HTTP Monitor Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `httpMonitorName` | The name of the HTTP monitor | `string` | `"example_http_monitor"` |
| `httpMonitorFrequency` | The frequency of the HTTP monitor | `number` | `5` |
| `httpLocationId` | The location ID for the HTTP monitor | `string` | `"example_location_id"` |
| `httpMonitorUrl` | The URL to be monitored | `string` | `"https://example.com"` |

## Outputs
| Name | Description |
|------|-------------|
| `http_monitor_id` | The ID of the HTTP monitor |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_http_monitor" {
  source = "./modules/http_monitor"

  httpMonitorName = var.httpMonitorName
  httpMonitorFrequency = var.httpMonitorFrequency
  httpLocationId = var.httpLocationId
  httpMonitorUrl = var.httpMonitorUrl
}
```


## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)
- Create and read synthetic monitors, locations, and nodes (`ExternalSyntheticIntegration`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace resources.


