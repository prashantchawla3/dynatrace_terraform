# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing custom devices in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

## Table of Contents
- Introduction
- Requirements
- Providers
- Resources
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

- `dynatrace_custom_device`

## Inputs
### Custom Device Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `custom_device_id` | The ID of the custom device | `string` | `"customDeviceId"` |
| `display_name` | The display name of the custom device | `string` | `"customDevicename"` |
| `config_url` | The configuration URL of the custom device | `string` | `"https://config.url"` |
| `dns_names` | The DNS names associated with the custom device | `list(string)` | `["dns1.example.com", "dns2.example.com"]` |
| `favicon_url` | The favicon URL of the custom device | `string` | `"https://favicon.url/icon.png"` |
| `group` | The group to which the custom device belongs | `string` | `"customGroup"` |
| `ip_addresses` | The IP addresses associated with the custom device | `list(string)` | `["192.168.1.1", "192.168.1.2"]` |
| `listen_ports` | The ports on which the custom device listens | `list(number)` | `[80, 443]` |
| `props` | The properties of the custom device | `string` | `"key1=value1,key2=value2"` |
| `type` | The type of the custom device | `string` | `"customType"` |
| `ui_based` | Whether the custom device is UI-based | `bool` | `true` |

## Outputs
| Name | Description |
|------|-------------|
| `custom_device_entity_id` | The entity ID of the custom device |
| `custom_device_id` | The ID of the custom device |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_custom_device" {
  source = "./modules/custom_device"

  custom_device_id = var.custom_device_id
  display_name = var.display_name
  config_url = var.config_url
  dns_names = var.dns_names
  favicon_url = var.favicon_url
  group = var.group
  ip_addresses = var.ip_addresses
  listen_ports = var.listen_ports
  props = var.props
  type = var.type
  ui_based = var.ui_based
}
```

