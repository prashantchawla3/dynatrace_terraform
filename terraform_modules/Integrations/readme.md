# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing issue tracking and remote environments in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_issue_tracking`
- `dynatrace_remote_environments`

## Inputs
### Issue Tracking Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `issue_tracking_enabled` | Enable or disable the issue tracking | `bool` | `true` |
| `issue_tracking_issuelabel` | Label to identify these issues | `string` | `"release_blocker"` |
| `issue_tracking_issuequery` | Query for the issue tracking | `string` | `"{NAME}, {VERSION}"` |
| `issue_tracking_issuetheme` | Theme of the issue | `string` | `"INFO"` |
| `issue_tracking_issuetrackersystem` | Issue tracker system | `string` | `"GITHUB"` |
| `issue_tracking_token` | Token for the issue tracker system | `string` | `"your-issue-tracking-token"` |
| `issue_tracking_url` | URL for the issue tracker system | `string` | `"https://github.com/sampleorg/samplerepo"` |
| `issue_tracking_username` | Username for the issue tracker system | `string` | `"terraform-user"` |
| `issue_tracking_insert_after` | ID of the resource instance that comes before this instance regarding order | `string` | `null` |
| `issue_tracking_password` | Password for the issue tracker system | `string` | `null` |

### Remote Environment Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `remote_environment_name` | Name of the remote environment | `string` | `"TerraformExample"` |
| `remote_environment_network_scope` | Network scope of the remote environment | `string` | `"EXTERNAL"` |
| `remote_environment_token` | Token for the remote environment | `string` | `"your-remote-environment-token"` |
| `remote_environment_uri` | URI of the remote environment | `string` | `"https://terraformexample.live.dynatrace.com"` |

## Outputs
| Name | Description |
|------|-------------|
| `issue_tracking_id` | ID of the created issue tracking configuration |
| `remote_environment_id` | ID of the created remote environment configuration |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_issue_tracking" {
  source = "./modules/issue_tracking"

  issue_tracking_enabled = var.issue_tracking_enabled
  issue_tracking_issuelabel = var.issue_tracking_issuelabel
  issue_tracking_issuequery = var.issue_tracking_issuequery
  issue_tracking_issuetheme = var.issue_tracking_issuetheme
  issue_tracking_issuetrackersystem = var.issue_tracking_issuetrackersystem
  issue_tracking_token = var.issue_tracking_token
  issue_tracking_url = var.issue_tracking_url
  issue_tracking_username = var.issue_tracking_username
  issue_tracking_insert_after = var.issue_tracking_insert_after
  issue_tracking_password = var.issue_tracking_password
}

module "dynatrace_remote_environments" {
  source = "./modules/remote_environments"

  remote_environment_name = var.remote_environment_name
  remote_environment_network_scope = var.remote_environment_network_scope
  remote_environment_token = var.remote_environment_token
  remote_environment_uri = var.remote_environment_uri
}
```

