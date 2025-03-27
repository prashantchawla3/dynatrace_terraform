# Dynatrace Terraform Module

This Terraform module provides resources for managing Dynatrace Service Level Objectives (SLOs). It includes configurations for SLOs, their evaluation, and error budget burn rate visualization.

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
module "dynatrace_slo" {
  source = "./path_to_module"

  slo_name = "example_slo"
  slo_enabled = true
  slo_description = "Terraform Test"
  slo_evaluation_type = "AGGREGATE"
  slo_evaluation_window = "-1w"
  slo_filter = "type(SERVICE),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)"
  slo_metric_expression = "100*(builtin:service.requestCount.server:splitBy())/(builtin:service.requestCount.server:splitBy())"
  slo_metric_name = "terraform_test"
  slo_target_success = 95
  slo_target_warning = 98
  slo_legacy_id = ""
  burn_rate_visualization_enabled = false
  fast_burn_threshold = null
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

- `dynatrace_slo_v2.example_slo`

## Inputs

| Name                             | Description                                | Type   | Default | Required |
| -------------------------------- | ------------------------------------------ | ------ | ------- | -------- |
| slo_name                         | SLO name                                   | string |         | yes      |
| slo_enabled                      | This setting is enabled (true) or disabled (false) | bool   | true    | yes      |
| slo_description                  | The description of the SLO                 | string | "Terraform Test" | yes      |
| slo_evaluation_type              | Evaluation type                            | string | "AGGREGATE" | yes      |
| slo_evaluation_window            | Evaluation window                          | string | "-1w"   | yes      |
| slo_filter                       | Filter parameter                           | string | "type(SERVICE),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)" | yes      |
| slo_metric_expression            | Metric expression                          | string | "100*(builtin:service.requestCount.server:splitBy())/(builtin:service.requestCount.server:splitBy())" | yes      |
| slo_metric_name                  | Metric name                                | string | "terraform_test" | yes      |
| slo_target_success               | Target success value                       | number | 95      | yes      |
| slo_target_warning               | Target warning value                       | number | 98      | yes      |
| slo_legacy_id                    | Legacy ID                                  | string | ""      | yes      |
| burn_rate_visualization_enabled  | Burn rate visualization enabled            | bool   | false   | yes      |
| fast_burn_threshold              | Fast burn threshold                        | number | null    | yes      |

## Outputs

| Name              | Description                          |
| ----------------- | ------------------------------------ |
| slo_id            | The ID of the created SLO            |
| slo_name          | The name of the created SLO          |

## Example

Here is an example of how to use this module in your Terraform configuration:

```hcl
module "dynatrace_slo" {
  source = "./path_to_module"

  slo_name = "example_slo"
  slo_enabled = true
  slo_description = "Terraform Test"
  slo_evaluation_type = "AGGREGATE"
  slo_evaluation_window = "-1w"
  slo_filter = "type(SERVICE),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)"
  slo_metric_expression = "100*(builtin:service.requestCount.server:splitBy())/(builtin:service.requestCount.server:splitBy())"
  slo_metric_name = "terraform_test"
  slo_target_success = 95
  slo_target_warning = 98
  slo_legacy_id = ""
  burn_rate_visualization_enabled = false
  fast_burn_threshold = null
}
```

