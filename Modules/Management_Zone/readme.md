# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing management zones in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

## Table of Contents
- Introduction
- Requirements
- [Providers](#providers)
- [Resources](#resources)
- Inputs
- Outputs
- Usage
- License

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

- `dynatrace_management_zone_v2`

## Inputs
### Management Zone Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `zone_name` | The name of the management zone | `string` | `"example_zone"` |
| `zone_description` | The description of the management zone | `string` | `""` |
| `zone_legacy_id` | The legacy ID of the management zone | `string` | `""` |
| `entity_selector` | The entity selector for the management zone rules | `string` | `""` |

## Outputs
| Name | Description |
|------|-------------|
| `management_zone_id` | The ID of the created management zone |
| `management_zone_name` | The name of the created management zone |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_management_zone" {
  source = "./modules/management_zone"

  zone_name = var.zone_name
  zone_description = var.zone_description
  zone_legacy_id = var.zone_legacy_id
  entity_selector = var.entity_selector
}
```
