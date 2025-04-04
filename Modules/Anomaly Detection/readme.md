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
- `dynatrace_aws_anomalies`
- `dynatrace_custom_app_anomalies`
- `dynatrace_custom_app_crash_rate`
- `dynatrace_database_anomalies_v2`
- `dynatrace_davis_anomaly_detectors`
- `dynatrace_disk_anomalies_v2`
- `dynatrace_disk_anomaly_rules`
- `dynatrace_disk_edge_anomaly_detectors`
- `dynatrace_disk_specific_anomalies_v2`
- `dynatrace_frequent_issues`
- `dynatrace_host_anomalies_v2`
- `dynatrace_k8s_cluster_anomalies`
- `dynatrace_k8s_namespace_anomalies`
- `dynatrace_k8s_node_anomalies`
- `dynatrace_k8s_pvc_anomalies`
- `dynatrace_k8s_workload_anomalies`
- `dynatrace_metric_events`
- `dynatrace_mobile_app_anomalies`
- `dynatrace_mobile_app_crash_rate`
- `dynatrace_service_anomalies_v2`
- `dynatrace_vmware_anomalies`
- `dynatrace_web_app_anomalies`

## Inputs
### Anomaly Detection Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `aws_anomalies_name` | Name for the AWS anomalies resource | `string` | `"aws_anomalies"` |
| `custom_app_scope` | Scope for the custom application anomalies | `string` | `"CUSTOM_APPLICATION-1234567890000000"` |
| `custom_app_crash_rate_scope` | Scope for the custom application crash rate | `string` | `"CUSTOM_APPLICATION-1234567890000000"` |
| `database_anomalies_scope` | Scope for the database anomalies | `string` | `"environment"` |
| `davis_anomaly_detectors_name` | Name for the Davis anomaly detectors | `string` | `"davis_anomaly_detectors"` |
| `disk_anomalies_scope` | Scope for the disk anomalies | `string` | `"environment"` |
| `disk_anomaly_rules_name` | Name for the disk anomaly rules | `string` | `"disk_anomaly_rules"` |
| `disk_edge_anomaly_detectors_name` | Name for the disk edge anomaly detectors | `string` | `"disk_edge_anomaly_detectors"` |
| `disk_specific_anomalies_disk_id` | Disk ID for the specific disk anomalies | `string` | `"DISK-1234567890000000"` |
| `host_anomalies_scope` | Scope for the host anomalies | `string` | `"HOST-1234567890000000"` |
| `k8s_cluster_anomalies_scope` | Scope for the Kubernetes cluster anomalies | `string` | `"environment"` |
| `k8s_namespace_anomalies_scope` | Scope for the Kubernetes namespace anomalies | `string` | `"environment"` |
| `k8s_node_anomalies_scope` | Scope for the Kubernetes node anomalies | `string` | `"environment"` |
| `k8s_pvc_anomalies_scope` | Scope for the Kubernetes PVC anomalies | `string` | `"environment"` |
| `k8s_workload_anomalies_scope` | Scope for the Kubernetes workload anomalies | `string` | `"environment"` |
| `metric_events_name` | Name for the metric events | `string` | `"metric_events"` |
| `mobile_app_scope` | Scope for the mobile application anomalies | `string` | `"MOBILE_APPLICATION-1234567890000000"` |
| `mobile_app_crash_rate_application_id` | Application ID for the mobile application crash rate | `string` | `"MOBILE_APPLICATION-1234567890000000"` |
| `service_anomalies_scope` | Scope for the service anomalies | `string` | `"SERVICE-1234567890000000"` |
| `vmware_anomalies_name` | Name for the VMware anomalies | `string` | `"vmware_anomalies"` |
| `web_app_scope` | Scope for the web application anomalies | `string` | `"APPLICATION-1234567890000000"` |

## Outputs
| Name | Description |
|------|-------------|
| `aws_anomalies_id` | ID of the created AWS anomalies configuration |
| `custom_app_anomalies_id` | ID of the created custom application anomalies configuration |
| `custom_app_crash_rate_id` | ID of the created custom application crash rate configuration |
| `database_anomalies_id` | ID of the created database anomalies configuration |
| `davis_anomaly_detectors_id` | ID of the created Davis anomaly detectors configuration |
| `disk_anomalies_id` | ID of the created disk anomalies configuration |
| `disk_anomaly_rules_id` | ID of the created disk anomaly rules configuration |
| `disk_edge_anomaly_detectors_id` | ID of the created disk edge anomaly detectors configuration |
| `disk_specific_anomalies_id` | ID of the created specific disk anomalies configuration |
| `host_anomalies_id` | ID of the created host anomalies configuration |
| `k8s_cluster_anomalies_id` | ID of the created Kubernetes cluster anomalies configuration |
| `k8s_namespace_anomalies_id` | ID of the created Kubernetes namespace anomalies configuration |
| `k8s_node_anomalies_id` | ID of the created Kubernetes node anomalies configuration |
| `k8s_pvc_anomalies_id` | ID of the created Kubernetes PVC anomalies configuration |
| `k8s_workload_anomalies_id` | ID of the created Kubernetes workload anomalies configuration |
| `metric_events_id` | ID of the created metric events configuration |
| `mobile_app_anomalies_id` | ID of the created mobile application anomalies configuration |
| `mobile_app_crash_rate_id` | ID of the created mobile application crash rate configuration |
| `service_anomalies_id` | ID of the created service anomalies configuration |
| `vmware_anomalies_id` | ID of the created VMware anomalies configuration |
| `web_app_anomalies_id` | ID of the created web application anomalies configuration |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token       = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_anomaly_detection" {
  source = "./modules/anomaly_detection"
  aws_anomalies_name = var.aws_anomalies_name
  custom_app_scope = var.custom_app_scope
  custom_app_crash_rate_scope = var.custom_app_crash_rate_scope
  database_anomalies_scope = var.database_anomalies_scope
  davis_anomaly_detectors_name = var.davis_anomaly_detectors_name
  disk_anomalies_scope = var.disk_anomalies_scope
  disk_anomaly_rules_name = var.disk_anomaly_rules_name
  disk_edge_anomaly_detectors_name = var.disk_edge_anomaly_detectors_name
  disk_specific_anomalies_disk_id = var.disk_specific_anomalies_disk_id
  host_anomalies_scope = var.host_anomalies_scope
  k8s_cluster_anomalies_scope = var.k8s_cluster_anomalies_scope
  k8s_namespace_anomalies_scope = var.k8s_namespace_anomalies_scope
  k8s_node_anomalies_scope = var.k8s_node_anomalies_scope
  k8s_pvc_anomalies_scope = var.k8s_pvc_anomalies_scope
  k8s_workload_anomalies_scope = var.k8s_workload_anomalies_scope
  metric_events_name = var.metric_events_name
  mobile_app_scope = var.mobile_app_scope
  mobile_app_crash_rate_application_id = var.mobile_app_crash_rate_application_id
  service_anomalies_scope = var.service_anomalies_scope
  vmware_anomalies_name = var.vmware_anomalies_name
  web_app_scope = var.web_app_scope
}
```

## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)


Make sure your API token includes these scopes to successfully create and manage the Dynatrace synthetic resources.

## Exporting Configuration for Different Resources
You can export configurations for different resources using the `terraform-provider-dynatrace -export` command. For example, to export all existing web application anomaly detection configurations, use `terraform-provider-dynatrace -export dynatrace_web_app_anomalies`. The resource name for this operation is `dynatrace_web_app_anomalies`.
```


