# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing DQL (Dynatrace Query Language) queries in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_dql`

## Inputs
### DQL Query Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `query` | The DQL query string | `string` | `"fetch events \n filter event.type == \"davis\" AND davis.status != \"CLOSED\" \n fields timestamp, davis.title, davis.underMaintenance, davis.status \n sort timestamp \n limit 10"` |
| `default_sampling_ratio` | The default sampling ratio | `number` | `1` |
| `default_scan_limit_gbytes` | Limit in gigabytes for the amount of data that will be scanned during read | `number` | `10` |
| `default_timeframe_end` | The query timeframe 'end' timestamp in ISO-8601 or RFC3339 format | `string` | `""` |
| `default_timeframe_start` | The query timeframe 'start' timestamp in ISO-8601 or RFC3339 format | `string` | `""` |
| `fetch_timeout_seconds` | The query will stop reading data after reaching the fetch-timeout | `number` | `60` |
| `locale` | The query locale | `string` | `"en"` |
| `max_result_bytes` | The maximum number of result bytes that this query will return | `number` | `1048576` |
| `max_result_records` | The maximum number of result records that this query will return | `number` | `1000` |
| `request_timeout_milliseconds` | The time a client is willing to wait for the query result | `number` | `30000` |
| `timezone` | The query timezone | `string` | `"UTC"` |

## Outputs
| Name | Description |
|------|-------------|
| `dql_id` | The ID of the DQL query |
| `dql_records` | The records returned by the DQL query |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_dql" {
  source = "./modules/dql"

  query = var.query
  default_sampling_ratio = var.default_sampling_ratio
  default_scan_limit_gbytes = var.default_scan_limit_gbytes
  default_timeframe_end = var.default_timeframe_end
  default_timeframe_start = var.default_timeframe_start
  fetch_timeout_seconds = var.fetch_timeout_seconds
  locale = var.locale
  max_result_bytes = var.max_result_bytes
  max_result_records = var.max_result_records
  request_timeout_milliseconds = var.request_timeout_milliseconds
  timezone = var.timezone
}
```
