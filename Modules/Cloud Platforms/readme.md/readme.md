# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing various resources in Dynatrace, including Cloud Foundry, Kubernetes monitoring, Kubernetes applications, and Kubernetes enrichment. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_cloud_foundry`
- `dynatrace_k8s_monitoring`
- `dynatrace_kubernetes`
- `dynatrace_kubernetes_app`
- `dynatrace_kubernetes_enrichment`

## Inputs
### Cloud Foundry Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `enabled` | This setting is enabled (true) or disabled (false) | `bool` | `true` |
| `active_gate_group` | ActiveGate group | `string` | `"Terraform"` |
| `api_url` | Cloud Foundry API Target | `string` | `"https://www.google.at/test/example"` |
| `label` | Name this connection | `string` | `"example"` |
| `login_url` | Cloud Foundry Authentication Endpoint | `string` | `"https://www.google.at/test/example"` |
| `password` | Cloud Foundry Password | `string` | `"pass2"` |
| `username` | Cloud Foundry Username | `string` | `"user"` |

### Kubernetes Monitoring Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `cloud_application_pipeline_enabled` | Monitor Kubernetes namespaces, services, workloads, and pods | `bool` | `true` |
| `event_processing_active` | All events are monitored unless event filters are specified | `bool` | `true` |
| `filter_events` | Include only events specified by Events Field Selectors | `bool` | `true` |
| `include_all_fdi_events` | Include all FDI events | `bool` | `true` |
| `open_metrics_builtin_enabled` | Workload and node resource metrics are based on a subset of cAdvisor metrics | `bool` | `false` |
| `open_metrics_pipeline_enabled` | Enable OpenMetrics pipeline | `bool` | `true` |
| `scope` | The scope of this setting (KUBERNETES_CLUSTER) | `string` | `"KUBERNETES_CLUSTER-1234567890000000"` |
| `event_pattern_active` | Activate event pattern | `bool` | `true` |
| `event_pattern_label` | Field selector name | `string` | `"Node events"` |
| `event_pattern_pattern` | Event pattern | `string` | `"involvedObject.kind=Node"` |

### Kubernetes Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `enabled` | This setting is enabled (true) or disabled (false) | `bool` | `true` |
| `cluster_id` | Unique ID of the cluster | `string` | `"example-cluster-id"` |
| `cluster_id_enabled` | Enable cluster ID | `bool` | `true` |
| `label` | Name this connection | `string` | `"example"` |
| `scope` | The scope of this setting (KUBERNETES_CLUSTER) | `string` | `"KUBERNETES_CLUSTER-1234567890000000"` |
| `active_gate_group` | ActiveGate group | `string` | `"Terraform"` |
| `auth_token` | Create a bearer token for Kubernetes or OpenShift | `string` | `""` |
| `certificate_check_enabled` | Require valid certificates for communication with API server | `bool` | `false` |
| `endpoint_url` | Get the API URL for Kubernetes or OpenShift | `string` | `""` |
| `hostname_verification_enabled` | Verify hostname in certificate against Kubernetes API URL | `bool` | `false` |

### Kubernetes App Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `scope` | The scope of this setting (KUBERNETES_CLUSTER) | `string` | `"KUBERNETES_CLUSTER-1234567890000000"` |
| `enable_kubernetes_app` | Enable new Kubernetes experience | `bool` | `true` |

### Kubernetes Enrichment Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `scope` | The scope of this setting (KUBERNETES_CLUSTER) | `string` | `"KUBERNETES_CLUSTER-1234567890000000"` |
| `rule_type_1` | Type of the first rule (ANNOTATION or LABEL) | `string` | `"LABEL"` |
| `rule_source_1` | Source of the first rule | `string` | `"example-source-1"` |
| `rule_target_1` | Target of the first rule | `string` | `"dt.cost.product"` |
| `rule_type_2` | Type of the second rule (ANNOTATION or LABEL) | `string` | `"ANNOTATION"` |
| `rule_source_2` | Source of the second rule | `string` | `"example-source-2"` |
| `rule_target_2` | Target of the second rule | `string` | `"dt.security_context"` |

## Outputs
| Name | Description |
|------|-------------|
| `cloud_foundry_id` | The ID of the Cloud Foundry resource |
| `k8s_monitoring_id` | The ID of the Kubernetes monitoring resource |
| `kubernetes_id` | The ID of the Kubernetes resource |
| `kubernetes_app_id` | The ID of the Kubernetes app resource |
| `kubernetes_enrichment_id` | The ID of the Kubernetes enrichment resource |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_cloud_foundry" {
  source = "./modules/cloud_foundry"

  enabled = var.enabled
  active_gate_group = var.active_gate_group
  api_url = var.api_url
  label = var.label
  login_url = var.login_url
  password = var.password
  username = var.username
}

module "dynatrace_k8s_monitoring" {
  source = "./modules/k8s_monitoring"

  cloud_application_pipeline_enabled = var.cloud_application_pipeline_enabled
  event_processing_active = var.event_processing_active
  filter_events = var.filter_events
  include_all_fdi_events = var.include_all_fdi_events
  open_metrics_builtin_enabled = var.open_metrics_builtin_enabled
  open_metrics_pipeline_enabled = var.open_metrics_pipeline_enabled
  scope = var.scope
  event_pattern_active = var.event_pattern_active
  event_pattern_label = var.event_pattern_label
  event_pattern_pattern = var.event_pattern_pattern
}

module "dynatrace_kubernetes" {
  source = "./modules/kubernetes"

  enabled = var.enabled
  cluster_id = var.cluster_id
  cluster_id_enabled = var.cluster_id_enabled
  label = var.label
  scope = var.scope
  active_gate_group = var.active_gate_group
  auth_token = var.auth_token
  certificate_check_enabled = var.certificate_check_enabled
  endpoint_url = var.endpoint_url
  hostname_verification_enabled = var.hostname_verification_enabled
}

module "dynatrace_kubernetes_app" {
  source = "./modules/kubernetes_app"

  scope = var.scope
  enable_kubernetes_app = var.enable_kubernetes_app
}

module "dynatrace_kubernetes_enrichment" {
  source = "./modules/kubernetes_enrichment"

  scope = var.scope
  rule_type_1 = var.rule_type_1
  rule_source_1 = var.rule_source_1
  rule_target_1 = var.rule_target_1
  rule_type_2 = var.rule_type_2
  rule_source_2 = var.rule_source_2
  rule_target_2 = var.rule_target_2
}
```
## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace resources.
