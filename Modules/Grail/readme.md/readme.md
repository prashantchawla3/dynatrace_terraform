# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing Dynatrace segments. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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
- `dynatrace_segment`

## Inputs
### Segment Variables
| Name                | Description                                      | Type    | Default             |
|---------------------|--------------------------------------------------|---------|---------------------|
| `segment_name`      | The name of the Dynatrace segment                | `string`| `"example-segment"` |
| `segment_description` | The description of the Dynatrace segment       | `string`| `"Example description"` |
| `is_public`         | Indicates if the filter-segment is publicly accessible within the tenant | `bool`   | `true`              |
| `cluster_name`      | The name of the Kubernetes cluster               | `string`| `"example-cluster"` |

## Outputs
| Name          | Description                       |
|---------------|-----------------------------------|
| `segment_id`  | The ID of the Dynatrace segment   |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token        = var.dynatrace_api_token
  environment_url  = var.dynatrace_environment_url
}

module "grail_segment" {
  source = "./modules/grail"

  segment_name        = var.segment_name
  segment_description = var.segment_description
  is_public           = var.is_public
  cluster_name        = var.cluster_name
}
```

## API Token Scopes
To utilize this resource with access to all segments, please define the environment variables `DT_CLIENT_ID`, `DT_CLIENT_SECRET`, `DT_ACCOUNT_ID` with an OAuth client including the following permissions: 
- View Filter-Segments (`storage:filter-segments:read`)
- Create and Update Filter-Segments (`storage:filter-segments:write`)
- Share Filter-Segments (`storage:filter-segments:share`)
- Delete Filter-Segments (`storage:filter-segments:delete`)
- Maintain all Filter-Segments on the environment (`storage:filter-segments:admin`)

Make sure your OAuth client includes these permissions to successfully create and manage the Dynatrace resources.

