# Dynatrace Terraform Module

## Introduction
This Terraform module manages Dynatrace resources for auto-tagging, auto-tag rules, and custom tags. It includes configurations for these resources along with necessary variables and outputs.

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
module "dynatrace_autotag" {
  source = "./path_to_module"
  autotag_name = var.autotag_name
  entity_selector = var.entity_selector
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

- `dynatrace_autotag_v2`
- `dynatrace_autotag_rules`
- `dynatrace_custom_tags`

## Inputs
### Dashboard Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `autotag_name` | The name of the auto tag | `string` | `"example_tag"` |
| `entity_selector` | Specifies the entities where you want to update tags | `string` | `"entityId(\"HOST-123456789000000\")"` |

## Outputs
| Name | Description |
|------|-------------|
| `autotag_id` | The ID of the auto tag resource |
| `autotag_rules_id` | The ID of the auto tag rules resource |
| `custom_tags_id` | The ID of the custom tags resource |

## Example
```hcl
module "dynatrace_autotag" {
  source = "./path_to_module"
  autotag_name = "example_tag"
  entity_selector = "entityId(\"HOST-123456789000000\")"
}
```

## API Token Scopes
This resource requires the API token scopes:
- Read configuration (`ReadConfig`)
- Write configuration (`WriteConfig`)
- Read settings (`settings.read`)
- Write settings (`settings.write`)
- Read entities (`entities.read`)
- Write entities (`entities.write`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace resources.

