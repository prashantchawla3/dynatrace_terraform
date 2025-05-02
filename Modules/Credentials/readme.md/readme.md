# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing AWS and Azure credentials, services, and general credentials in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_aws_credentials`
- `dynatrace_aws_service`
- `dynatrace_azure_credentials`
- `dynatrace_azure_service`
- `dynatrace_credentials`

## Inputs
### AWS Credentials Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `aws_label` | The name of the AWS credentials | `string` | `"your-aws-label"` |
| `aws_partition_type` | The type of the AWS partition | `string` | `"AWS_DEFAULT"` |
| `aws_tagged_only` | Monitor only resources which have specified AWS tags (true) or all resources (false) | `bool` | `false` |
| `aws_account_id` | The ID of the Amazon account | `string` | `"your-aws-account-id"` |
| `aws_iam_role` | The IAM role to be used by Dynatrace to get monitoring data | `string` | `"your-aws-iam-role"` |
| `aws_remove_defaults` | Instructs the provider to remove the supporting services Dynatrace applies by default to newly created AWS Credentials | `bool` | `true` |
| `aws_services` | A map of AWS services to be monitored | `map(object({ use_recommended_metrics = bool }))` | `{ "service1": { use_recommended_metrics = true }, "service2": { use_recommended_metrics = true } }` |

### Azure Credentials Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `azure_active` | The monitoring is enabled (true) or disabled (false) | `bool` | `true` |
| `azure_app_id` | The Application ID (also referred to as Client ID) | `string` | `"your-azure-app-id"` |
| `azure_auto_tagging` | The automatic capture of Azure tags is on (true) or off (false) | `bool` | `true` |
| `azure_directory_id` | The Directory ID (also referred to as Tenant ID) | `string` | `"your-azure-directory-id"` |
| `azure_label` | The unique name of the Azure credentials configuration | `string` | `"your-azure-label"` |
| `azure_key` | The secret key associated with the Application ID | `string` | `"your-azure-key"` |
| `azure_monitor_only_tagged_entities` | Monitor only resources that have specified Azure tags (true) or all resources (false) | `bool` | `true` |
| `azure_monitor_only_tag_pairs` | A list of Azure tags to be monitored | `list(object({ name = string, value = string }))` | `[ { name = "tag1", value = "value1" }, { name = "tag2", value = "value2" } ]` |
| `azure_remove_defaults` | Instructs the provider to remove the supporting services Dynatrace applies by default to newly created Azure Credentials | `bool` | `true` |
| `azure_services` | A map of Azure services to be monitored | `map(object({ use_recommended_metrics = bool }))` | `{ "service1": { use_recommended_metrics = true }, "service2": { use_recommended_metrics = true } }` |

### General Credentials Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `credentials_name` | The name of the credentials set | `string` | `"your-credentials-name"` |
| `credentials_scopes` | The set of scopes of the credentials set | `list(string)` | `["SYNTHETIC"]` |
| `credentials_username` | The username of the credentials set | `string` | `"your-credentials-username"` |
| `credentials_password` | The password of the credential | `string` | `"your-credentials-password"` |

## Outputs
| Name | Description |
|------|-------------|
| `aws_credentials_id` | The ID of the AWS credentials |
| `azure_credentials_id` | The ID of the Azure credentials |
| `credentials_id` | The ID of the credentials |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_aws" {
  source = "./modules/aws"

  aws_label = var.aws_label
  aws_partition_type = var.aws_partition_type
  aws_tagged_only = var.aws_tagged_only
  aws_account_id = var.aws_account_id
  aws_iam_role = var.aws_iam_role
  aws_remove_defaults = var.aws_remove_defaults
  aws_services = var.aws_services
}

module "dynatrace_azure" {
  source = "./modules/azure"

  azure_active = var.azure_active
  azure_app_id = var.azure_app_id
  azure_auto_tagging = var.azure_auto_tagging
  azure_directory_id = var.azure_directory_id
  azure_label = var.azure_label
  azure_key = var.azure_key
  azure_monitor_only_tagged_entities = var.azure_monitor_only_tagged_entities
  azure_monitor_only_tag_pairs = var.azure_monitor_only_tag_pairs
  azure_remove_defaults = var.azure_remove_defaults
  azure_services = var.azure_services
}

module "dynatrace_credentials" {
  source = "./modules/credentials"

  credentials_name = var.credentials_name
  credentials_scopes = var.credentials_scopes
  credentials_username = var.credentials_username
  credentials_password = var.credentials_password
}
```

---

## API Token Scopes
This resource requires the API token scopes:
- Read configuration (`ReadConfig`)
- Write configuration (`WriteConfig`)
- Read credential vault entries (`credentialVault.read`)
- Write credential vault entries (`credentialVault.write`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace resources.


