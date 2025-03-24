# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing various container-related resources in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_container_builtin_rule`
- `dynatrace_container_registry`
- `dynatrace_container_rule`
- `dynatrace_container_technology`

## Inputs
### Container Built-in Rule Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `ignore_docker_pause_container` | Disable monitoring of platform internal pause containers in Kubernetes and OpenShift | `bool` | `false` |
| `ignore_kubernetes_pause_container` | Disable monitoring of platform internal pause containers in Kubernetes and OpenShift | `bool` | `true` |
| `ignore_open_shift_build_pod_name` | Disable monitoring of intermediate containers created during image build | `bool` | `false` |
| `ignore_open_shift_sdn_namespace` | Disable monitoring of platform internal containers in the openshift-sdn namespace | `bool` | `true` |

### Container Registry Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `container_registry` | The container registry URL | `string` | `"private.registry.org"` |

### Container Rule Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `container_rule_enabled` | This setting is enabled (true) or disabled (false) | `bool` | `true` |
| `container_rule_mode` | Possible Values: MONITORING_OFF, MONITORING_ON | `string` | `"MONITORING_ON"` |
| `container_rule_operator` | Possible Values: CONTAINS, ENDS, EQUALS, EXISTS, NOT_CONTAINS, NOT_ENDS, NOT_EQUALS, NOT_EXISTS, NOT_STARTS, STARTS | `string` | `"NOT_CONTAINS"` |
| `container_rule_property` | Possible Values: CONTAINER_NAME, IMAGE_NAME, KUBERNETES_BASEPODNAME, KUBERNETES_CONTAINERNAME, KUBERNETES_FULLPODNAME, KUBERNETES_NAMESPACE, KUBERNETES_PODUID | `string` | `"CONTAINER_NAME"` |
| `container_rule_value` | Condition value | `string` | `"Terraform"` |

### Container Technology Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `bosh_process_manager` | Platform: Cloud Foundry | `bool` | `true` |
| `containerd` | Platform: Kubernetes | `bool` | `true` |
| `crio` | Platform: Kubernetes | `bool` | `true` |
| `docker` | Platform: Docker and Kubernetes | `bool` | `true` |
| `docker_windows` | Platform: Docker | `bool` | `true` |
| `garden` | Platform: Cloud Foundry | `bool` | `true` |
| `podman` | Platform: Podman | `bool` | `true` |
| `scope` | The scope of this setting (HOST, HOST_GROUP). Omit this property if you want to cover the whole environment. | `string` | `"environment"` |
| `winc` | Platform: Cloud Foundry | `bool` | `true` |

## Outputs
| Name | Description |
|------|-------------|
| `container_rule_id` | The ID of the container built-in rule |
| `container_registry_id` | The ID of the container registry |
| `container_monitoring_rule_id` | The ID of the container monitoring rule |
| `container_technology_id` | The ID of the container technology |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_container" {
  source = "./modules/container"

  ignore_docker_pause_container = var.ignore_docker_pause_container
  ignore_kubernetes_pause_container = var.ignore_kubernetes_pause_container
  ignore_open_shift_build_pod_name = var.ignore_open_shift_build_pod_name
  ignore_open_shift_sdn_namespace = var.ignore_open_shift_sdn_namespace
  container_registry = var.container_registry
  container_rule_enabled = var.container_rule_enabled
  container_rule_mode = var.container_rule_mode
  container_rule_operator = var.container_rule_operator
  container_rule_property = var.container_rule_property
  container_rule_value = var.container_rule_value
  bosh_process_manager = var.bosh_process_manager
  containerd = var.containerd
  crio = var.crio
  docker = var.docker
  docker_windows = var.docker_windows
  garden = var.garden
  podman = var.podman
  scope = var.scope
  winc = var.winc
}
```

