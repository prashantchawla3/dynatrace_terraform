# Dynatrace Terraform Module

This Terraform module manages Dynatrace resources for calculated synthetic metrics, synthetic availability, and synthetic locations. It includes configurations for these resources along with necessary variables and outputs.

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
module "dynatrace_synthetic" {
  source = "./path_to_module"

  calculated_synthetic_metric_name = var.calculated_synthetic_metric_name
  calculated_synthetic_metric_enabled = var.calculated_synthetic_metric_enabled
  calculated_synthetic_metric_metric = var.calculated_synthetic_metric_metric
  calculated_synthetic_metric_metric_key = var.calculated_synthetic_metric_metric_key
  calculated_synthetic_metric_monitor_identifier = var.calculated_synthetic_metric_monitor_identifier
  synthetic_availability_exclude_maintenance_windows = var.synthetic_availability_exclude_maintenance_windows
  synthetic_location_name = var.synthetic_location_name
  synthetic_location_auto_update_chromium = var.synthetic_location_auto_update_chromium
  synthetic_location_availability_location_outage = var.synthetic_location_availability_location_outage
  synthetic_location_availability_node_outage = var.synthetic_location_availability_node_outage
  synthetic_location_availability_notifications_enabled = var.synthetic_location_availability_notifications_enabled
  synthetic_location_city = var.synthetic_location_city
  synthetic_location_country_code = var.synthetic_location_country_code
  synthetic_location_deployment_type = var.synthetic_location_deployment_type
  synthetic_location_latitude = var.synthetic_location_latitude
  synthetic_location_location_node_outage_delay_in_minutes = var.synthetic_location_location_node_outage_delay_in_minutes
  synthetic_location_longitude = var.synthetic_location_longitude
  synthetic_location_region_code = var.synthetic_location_region_code
}
```

## Requirements

- Terraform >= 0.12
- Dynatrace provider >= 1.0

## Providers

| Name      | Version |
|-----------|---------|
| dynatrace | ~> 1.0  |

## Resources

| Name                                                                 | Type     |
|----------------------------------------------------------------------|----------|
| dynatrace_calculated_synthetic_metric.example | Resource |
| dynatrace_synthetic_availability.example  | Resource |
| dynatrace_synthetic_location.example          | Resource |

### Calculated Synthetic Metric

```hcl
resource "dynatrace_calculated_synthetic_metric" "example" {
  name = var.calculated_synthetic_metric_name
  enabled = var.calculated_synthetic_metric_enabled
  metric = var.calculated_synthetic_metric_metric
  metric_key = var.calculated_synthetic_metric_metric_key
  monitor_identifier = var.calculated_synthetic_metric_monitor_identifier
}
```

### Synthetic Availability

```hcl
resource "dynatrace_synthetic_availability" "example" {
  exclude_maintenance_windows = var.synthetic_availability_exclude_maintenance_windows
}
```

### Synthetic Location

```hcl
resource "dynatrace_synthetic_location" "example" {
  name = var.synthetic_location_name
  auto_update_chromium = var.synthetic_location_auto_update_chromium
  availability_location_outage = var.synthetic_location_availability_location_outage
  availability_node_outage = var.synthetic_location_availability_node_outage
  availability_notifications_enabled = var.synthetic_location_availability_notifications_enabled
  city = var.synthetic_location_city
  country_code = var.synthetic_location_country_code
  deployment_type = var.synthetic_location_deployment_type
  latitude = var.synthetic_location_latitude
  location_node_outage_delay_in_minutes = var.synthetic_location_location_node_outage_delay_in_minutes
  longitude = var.synthetic_location_longitude
  region_code = var.synthetic_location_region_code
}
```

## Inputs

| Name                                          | Description                                                                 | Type         | Default             |
|-----------------------------------------------|-----------------------------------------------------------------------------|--------------|---------------------|
| calculated_synthetic_metric_name              | The displayed name of the calculated synthetic metric                       | `string`     | `"example_metric"`  |
| calculated_synthetic_metric_enabled           | The metric is enabled (true) or disabled (false)                            | `bool`       | `true`              |
| calculated_synthetic_metric_metric            | The type of the synthetic metric                                            | `string`     | `"ResourceCount"`   |
| calculated_synthetic_metric_metric_key        | The unique key of the calculated synthetic metric                           | `string`     | `"calc:synthetic.browser.example_metric"` |
| calculated_synthetic_metric_monitor_identifier | The Dynatrace entity ID of the monitor to which the metric belongs          | `string`     | `"SYNTHETIC_TEST-147CFF44DDB25C05"` |
| synthetic_availability_exclude_maintenance_windows | Exclude periods with maintenance windows from availability calculation      | `bool`       | `true`              |
| synthetic_location_name                       | The name of the location                                                    | `string`     | `"example_location"`|
| synthetic_location_auto_update_chromium       | Auto upgrade of Chromium is enabled (true) or disabled (false)              | `bool`       | `true`              |
| synthetic_location_availability_location_outage | The alerting of location outage is enabled (true) or disabled (false)       | `bool`       | `true`              |
| synthetic_location_availability_node_outage   | The alerting of node outage is enabled (true) or disabled (false)           | `bool`       | `true`              |
| synthetic_location_availability_notifications_enabled | The notifications of location and node outage is enabled (true) or disabled (false) | `bool`       | `true`              |
| synthetic_location_city                       | The city of the location                                                    | `string`     | `"San Francisco de Asis"` |
| synthetic_location_country_code               | The country code of the location                                            | `string`     | `"VE"`              |
| synthetic_location_deployment_type            | The deployment type of the location                                         | `string`     | `"STANDARD"`        |
| synthetic_location_latitude                   | The latitude of the location in DDD.dddd format                             | `number`     | `10.0758`           |
| synthetic_location_location_node_outage_delay_in_minutes | Alert if the location or node outage lasts longer than X minutes            | `number`     | `3`                 |
| synthetic_location_longitude                  | The longitude of the location in DDD.dddd format                            | `number`     | `-67.5442`          |
| synthetic_location_region_code                | The region code of the location                                             | `string`     | `"04"`              |

## Outputs

| Name                                 | Description                                               |
|--------------------------------------|-----------------------------------------------------------|
| calculated_synthetic_metric_id       | The ID of the calculated synthetic metric resource        |
| synthetic_availability_id            | The ID of the synthetic availability resource             |
| synthetic_location_id                | The ID of the synthetic location resource                 |

## Example

```hcl
module "dynatrace_synthetic" {
  source = "./path_to_module"

  calculated_synthetic_metric_name = "example_metric"
  calculated_synthetic_metric_enabled = true
  calculated_synthetic_metric_metric = "ResourceCount"
  calculated_synthetic_metric_metric_key = "calc:synthetic.browser.example_metric"
  calculated_synthetic_metric_monitor_identifier = "SYNTHETIC_TEST-147CFF44DDB25C05"
  synthetic_availability_exclude_maintenance_windows = true
  synthetic_location_name = "example_location"
  synthetic_location_auto_update_chromium = true
  synthetic_location_availability_location_outage = true
  synthetic_location_availability_node_outage = true
  synthetic_location_availability_notifications_enabled = true
  synthetic_location_city = "San Francisco de Asis"
  synthetic_location_country_code = "VE"
  synthetic_location_deployment_type = "STANDARD"
  synthetic_location_latitude = 10.0758
  synthetic_location_location_node_outage_delay_in_minutes = 3
  synthetic_location_longitude = -67.5442
  synthetic_location_region_code = "04"
}
```

