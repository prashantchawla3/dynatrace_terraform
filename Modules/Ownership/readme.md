# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing ownership teams in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_ownership_teams`

## Inputs
### Ownership Team Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `team_name` | Team name | `string` | `"example_team"` |
| `team_description` | Description of the team | `string` | `"Created by Terraform"` |
| `team_identifier` | The team identifier | `string` | `"Terraform"` |
| `team_external_id` | External ID for automation purposes | `string` | `""` |
| `responsibility_development` | Responsible for development | `bool` | `true` |
| `responsibility_infrastructure` | Responsible for infrastructure | `bool` | `false` |
| `responsibility_line_of_business` | Responsible for line of business | `bool` | `false` |
| `responsibility_operations` | Responsible for operations | `bool` | `true` |
| `responsibility_security` | Responsible for security | `bool` | `false` |
| `additional_info_key` | Key for additional information | `string` | `"HashiCorp"` |
| `additional_info_value` | Value for additional information | `string` | `"Terraform"` |
| `additional_info_url` | URL for additional information | `string` | `"https://www.terraform.io/"` |
| `contact_integration_type` | Integration type for contact details | `string` | `"EMAIL"` |
| `contact_email` | Email for contact details | `string` | `"example@example.com"` |
| `contact_ms_teams` | MS Teams contact | `string` | `""` |
| `contact_slack_channel` | Slack channel contact | `string` | `""` |
| `contact_url` | URL for contact details | `string` | `""` |
| `contact_jira_default_assignee` | Default assignee for JIRA | `string` | `""` |
| `contact_jira_project` | Project for JIRA | `string` | `""` |
| `link_type` | Type of link | `string` | `"URL"` |
| `link_url` | URL for the link | `string` | `"https://www.google.com"` |
| `supplementary_identifier` | Supplementary identifier | `string` | `"supplementary-id-example"` |

## Outputs
| Name | Description |
|------|-------------|
| `team_id` | The ID of the created team |
| `team_name` | The name of the created team |

## Usage
### Example Configuration
```hcl
provider "dynatrace" {
  api_token = var.dynatrace_api_token
  environment_url = var.dynatrace_environment_url
}

module "dynatrace_ownership_teams" {
  source = "./modules/ownership_teams"

  team_name = var.team_name
  team_description = var.team_description
  team_identifier = var.team_identifier
  team_external_id = var.team_external_id
  responsibility_development = var.responsibility_development
  responsibility_infrastructure = var.responsibility_infrastructure
  responsibility_line_of_business = var.responsibility_line_of_business
  responsibility_operations = var.responsibility_operations
  responsibility_security = var.responsibility_security
  additional_info_key = var.additional_info_key
  additional_info_value = var.additional_info_value
  additional_info_url = var.additional_info_url
  contact_integration_type = var.contact_integration_type
  contact_email = var.contact_email
  contact_ms_teams = var.contact_ms_teams
  contact_slack_channel = var.contact_slack_channel
  contact_url = var.contact_url
  contact_jira_default_assignee = var.contact_jira_default_assignee
  contact_jira_project = var.contact_jira_project
  link_type = var.link_type
  link_url = var.link_url
  supplementary_identifier = var.supplementary_identifier
}
```
## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace  resources.