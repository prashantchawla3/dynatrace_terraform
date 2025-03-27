# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing anomaly detection configurations in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

## Table of Contents
- Introduction
- Requirements
- Providers
- Modules
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

## Modules
This module does not utilize any external modules.

## Resources
The following resources are created by this module:

- `dynatrace_service_anomalies_v2`

## Inputs
### Anomaly Detection Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `scope` | Scope of the anomaly detection (e.g., SERVICE, SERVICE_METHOD, HOST_GROUP) | `string` | `"SERVICE"` |
| `failure_rate_enabled` | Enable or disable failure rate detection | `bool` | `true` |
| `failure_rate_detection_mode` | Detection mode for failure rate (e.g., 'fixed') | `string` | `"fixed"` |
| `failure_rate_sensitivity` | Sensitivity for failure rate detection (e.g., 'high') | `string` | `"high"` |
| `failure_rate_threshold` | Threshold for failure rate detection | `number` | `5` |
| `failure_rate_minutes_abnormal_state` | Minutes in abnormal state for failure rate detection | `number` | `1` |
| `failure_rate_requests_per_minute` | Requests per minute for failure rate detection | `number` | `10` |
| `load_drop_enabled` | Enable or disable load drop detection | `bool` | `true` |
| `load_drop_percent` | Percent for load drop detection | `number` | `50` |
| `load_drop_minutes_abnormal_state` | Minutes in abnormal state for load drop detection | `number` | `1` |
| `load_spike_enabled` | Enable or disable load spike detection | `bool` | `true` |
| `load_spike_percent` | Percent for load spike detection | `number` | `200` |
| `load_spike_minutes_abnormal_state` | Minutes in abnormal state for load spike detection | `number` | `1` |
| `response_time_enabled` | Enable or disable response time detection | `bool` | `true` |
| `response_time_detection_mode` | Detection mode for response time (e.g., 'fixed') | `string` | `"fixed"` |
| `response_time_sensitivity` | Sensitivity for response time detection (e.g., 'high') | `string` | `"high"` |
| `response_time_minutes_abnormal_state` | Minutes in abnormal state for response time detection | `number` | `1` |
| `response_time_requests_per_minute` | Requests per minute for response time detection | `number` | `10` |
| `response_time_degradation_milliseconds` | Degradation milliseconds for response time detection | `number` | `100` |
| `response_time_slowest_degradation_milliseconds` | Slowest degradation milliseconds for response time detection | `number` | `1000` |

## Outputs
| Name | Description |
|------|-------------|
| `anomaly_detection_id` | ID of the created anomaly detection configuration |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_anomaly_detection" {
  source = "./modules/anomaly_detection"

  scope = var.scope
  failure_rate_enabled = var.failure_rate_enabled
  failure_rate_detection_mode = var.failure_rate_detection_mode
  failure_rate_sensitivity = var.failure_rate_sensitivity
  failure_rate_threshold = var.failure_rate_threshold
  failure_rate_minutes_abnormal_state = var.failure_rate_minutes_abnormal_state
  failure_rate_requests_per_minute = var.failure_rate_requests_per_minute
  load_drop_enabled = var.load_drop_enabled
  load_drop_percent = var.load_drop_percent
  load_drop_minutes_abnormal_state = var.load_drop_minutes_abnormal_state
  load_spike_enabled = var.load_spike_enabled
  load_spike_percent = var.load_spike_percent
  load_spike_minutes_abnormal_state = var.load_spike_minutes_abnormal_state
  response_time_enabled = var.response_time_enabled
  response_time_detection_mode = var.response_time_detection_mode
  response_time_sensitivity = var.response_time_sensitivity
  response_time_minutes_abnormal_state = var.response_time_minutes_abnormal_state
  response_time_requests_per_minute = var.response_time_requests_per_minute
  response_time_degradation_milliseconds = var.response_time_degradation_milliseconds
  response_time_slowest_degradation_milliseconds = var.response_time_slowest_degradation_milliseconds
}
```


