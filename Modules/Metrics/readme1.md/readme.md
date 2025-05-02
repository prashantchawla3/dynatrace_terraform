# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing custom units, histogram metrics, metric metadata, and metric queries in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_custom_units`
- `dynatrace_histogram_metrics`
- `dynatrace_metric_metadata`
- `dynatrace_metric_query`

## Inputs
### Custom Units Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `custom_units_name` | Unit name has to be unique and is used as identifier | `string` | `"example_unit"` |
| `custom_units_description` | Unit description should provide additional information about the new unit | `string` | `"Created by Terraform"` |
| `custom_units_plural_name` | Unit plural name represents the plural form of the unit name | `string` | `"TerraformUnits"` |
| `custom_units_symbol` | Unit symbol has to be unique | `string` | `"T/u"` |

### Histogram Metrics Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `histogram_metrics_enable_histogram_bucket_ingest` | Enable histogram bucket ingest | `bool` | `false` |

### Metric Metadata Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `metric_metadata_display_name` | Display name | `string` | `"example_metric"` |
| `metric_metadata_metric_id` | The scope of this setting (metric) | `string` | `"metric-func:slo.terraform-test"` |
| `metric_metadata_unit` | Unit | `string` | `"percent"` |

### Metric Query Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `metric_query_metric_id` | The scope of this setting (metric) | `string` | `"metric-func:slo.terraform-test"` |
| `metric_query_metric_selector` | Query | `string` | `"((100*(builtin:service.requestCount.server:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),mzId(0000000000000000000),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE\"))):splitBy())/(builtin:service.requestCount.server:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),mzId(0000000000000000000),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE\"))):splitBy())) - (95.0))"` |

## Outputs
| Name | Description |
|------|-------------|
| `custom_units_id` | The ID of the custom units |
| `histogram_metrics_id` | The ID of the histogram metrics |
| `metric_metadata_id` | The ID of the metric metadata |
| `metric_query_id` | The ID of the metric query |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_custom_units" {
  source = "./modules/custom_units"

  custom_units_name = var.custom_units_name
  custom_units_description = var.custom_units_description
  custom_units_plural_name = var.custom_units_plural_name
  custom_units_symbol = var.custom_units_symbol
}

module "dynatrace_histogram_metrics" {
  source = "./modules/histogram_metrics"

  histogram_metrics_enable_histogram_bucket_ingest = var.histogram_metrics_enable_histogram_bucket_ingest
}

module "dynatrace_metric_metadata" {
  source = "./modules/metric_metadata"

  metric_metadata_display_name = var.metric_metadata_display_name
  metric_metadata_metric_id = var.metric_metadata_metric_id
  metric_metadata_unit = var.metric_metadata_unit
}

module "dynatrace_metric_query" {
  source = "./modules/metric_query"

  metric_query_metric_id = var.metric_query_metric_id
  metric_query_metric_selector = var.metric_query_metric_selector
}
```
## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)


Make sure your API token includes these scopes to successfully create and manage the Dynatrace resources.
