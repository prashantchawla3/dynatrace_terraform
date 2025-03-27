# Dynatrace Terraform Module

This Terraform module provides resources for managing Dynatrace Davis CoPilot. It includes configurations for enabling CoPilot, tenant-aware data mining, and blocklist entries.

## Table of Contents

- Dynatrace Terraform Module
  - Table of Contents
  - Usage
  - Requirements
  - Providers
  - Resources
  - Inputs
  - Outputs

## Usage

To use this module, include it in your Terraform configuration as follows:

```hcl
module "dynatrace_davis_copilot" {
  source = "./path_to_module"

  enable_copilot = true
  enable_tenant_aware_data_mining = true
  blocklist_name = "example_blocklist"
  blocklist_type = "TABLE"
}
```

## Requirements

- Terraform >= 0.12
- Dynatrace provider >= 1.0

## Providers

| Name      | Version |
| --------- | ------- |
| dynatrace | ~> 1.0  |

## Resources

The following resources are created by this module:

- `dynatrace_davis_copilot.example`

## Inputs

| Name                             | Description                                | Type   | Default | Required |
| -------------------------------- | ------------------------------------------ | ------ | ------- | -------- |
| enable_copilot                   | Enable Davis CoPilot.                      | bool   | true    | yes      |
| enable_tenant_aware_data_mining  | Enable tenant-aware data mining.           | bool   | true    | yes      |
| blocklist_name                   | Name of the blocklist entry.               | string |         | yes      |
| blocklist_type                   | Type of the blocklist entry (BUCKET, TABLE). | string |         | yes      |

## Outputs

| Name              | Description                          |
| ----------------- | ------------------------------------ |
| davis_copilot_id  | ID of the Davis CoPilot resource     |

## Example

Here is an example of how to use this module in your Terraform configuration:

```hcl
module "dynatrace_davis_copilot" {
  source = "./path_to_module"

  enable_copilot = true
  enable_tenant_aware_data_mining = true
  blocklist_name = "example_blocklist"
  blocklist_type = "TABLE"
}
```



