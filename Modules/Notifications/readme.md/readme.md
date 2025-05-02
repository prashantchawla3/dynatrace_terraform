

# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing various notification integrations in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_ansible_tower_notification`
- `dynatrace_email_notification`
- `dynatrace_jira_notification`
- `dynatrace_mobile_notifications`
- `dynatrace_ops_genie_notification`
- `dynatrace_pager_duty_notification`
- `dynatrace_service_now_notification`
- `dynatrace_slack_notification`
- `dynatrace_trello_notification`
- `dynatrace_victor_ops_notification`
- `dynatrace_webhook_notification`
- `dynatrace_xmatters_notification`
- `dynatrace_alerting`

## Inputs
### Ansible Tower Notification Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `ansible_tower_active` | Whether the Ansible Tower notification is active | `bool` | `false` |
| `ansible_tower_name` | The name of the Ansible Tower notification | `string` | `"Ansible Tower Notification"` |
| `ansible_tower_insecure` | Whether the Ansible Tower connection is insecure | `bool` | `true` |
| `ansible_tower_job_template_url` | The job template URL for Ansible Tower | `string` | `"https://localhost/#/templates/job_template/999"` |
| `ansible_tower_username` | The username for Ansible Tower | `string` | `"foo"` |
| `ansible_tower_password` | The password for Ansible Tower | `string` | `"bar"` |
| `ansible_tower_custom_message` | The custom message for Ansible Tower | `string` | `"some-custom-message"` |

### Email Notification Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `email_active` | Whether the email notification is active | `bool` | `false` |
| `email_name` | The name of the email notification | `string` | `"Email Notification"` |
| `email_subject` | The subject of the email notification | `string` | `"EMAIL-SUBJECT"` |
| `email_to` | The recipients of the email notification | `list(string)` | `["she@home.com", "me@home.com", "you@home.com"]` |
| `email_cc` | The CC recipients of the email notification | `list(string)` | `["she@home.org", "me@home.org", "you@home.org"]` |
| `email_bcc` | The BCC recipients of the email notification | `list(string)` | `["she@home.gov", "me@home.gov", "you@home.gov"]` |
| `email_notify_closed_problems` | Whether to notify about closed problems | `bool` | `true` |
| `email_body` | The body of the email notification | `string` | `"{ProblemDetailsHTML}"` |

### Jira Notification Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `jira_active` | Whether the Jira notification is active | `bool` | `false` |
| `jira_name` | The name of the Jira notification | `string` | `"Jira Notification"` |
| `jira_url` | The URL for Jira | `string` | `"https://localhost:9999/jira/#name#"` |
| `jira_username` | The username for Jira | `string` | `"jira-user-name"` |
| `jira_api_token` | The API token for Jira | `string` | `"jira-api-token"` |
| `jira_project_key` | The project key for Jira | `string` | `"JIRA-PROJECT-KEY"` |
| `jira_issue_type` | The issue type for Jira | `string` | `"jira-issue-type"` |
| `jira_summary` | The summary for Jira | `string` | `"jira-summary"` |
| `jira_description` | The description for Jira | `string` | `"jira-description"` |

### Mobile Notifications Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `mobile_enabled` | Whether mobile notifications are enabled | `bool` | `false` |

### OpsGenie Notification Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `ops_genie_active` | Whether the OpsGenie notification is active | `bool` | `false` |
| `ops_genie_name` | The name of the OpsGenie notification | `string` | `"OpsGenie Notification"` |
| `ops_genie_domain` | The domain for OpsGenie | `string` | `"opsgenie-domain"` |
| `ops_genie_message` | The message for OpsGenie | `string` | `"ops-genie-message"` |
| `ops_genie_api_key` | The API key for OpsGenie | `string` | `"ops-genie-api-key"` |

### PagerDuty Notification Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `pager_duty_active` | Whether the PagerDuty notification is active | `bool` | `false` |
| `pager_duty_name` | The name of the PagerDuty notification | `string` | `"PagerDuty Notification"` |
| `pager_duty_account` | The account for PagerDuty | `string` | `"pager-duty-account"` |
| `pager_duty_service` | The service for PagerDuty | `string` | `"pager-duty-service"` |
| `pager_duty_api_key` | The API key for PagerDuty | `string` | `"pager-duty-api-key"` |

### ServiceNow Notification Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `service_now_active` | Whether the ServiceNow notification is active | `bool` | `false` |
| `service_now_name` | The name of the ServiceNow notification | `string` | `"ServiceNow Notification"` |
| `service_now_instance` | The instance for ServiceNow | `string` | `"service-now-instance"` |
| `service_now_username` | The username for ServiceNow | `string` | `"service-now-username"` |
| `service_now_password` | The password for ServiceNow | `string` | `"service-now-password"` |
| `service_now_message` | The message for ServiceNow | `string` | `"service-now-message"` |
| `service_now_incidents` | Whether to create incidents in ServiceNow | `bool` | `true` |
| `service_now_events` | Whether to create events in ServiceNow | `bool` | `true` |

### Slack Notification Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `slack_active` | Whether the Slack notification is active | `bool` | `false` |
| `slack_name` | The name of the Slack notification | `string` | `"Slack Notification"` |
| `slack_url` | The URL for Slack | `string` | `"https://slack.home.com"` |
| `slack_channel` | The channel for Slack | `string` | `"#general"` |
| `slack_message` | The message for Slack | `string` | `"slack-message"` |

### Trello Notification Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `trello_active` | Whether the Trello notification is active | `bool` | `false` |
| `trello_name` | The name of the Trello notification | `string` | `"Trello Notification"` |
| `trello_application_key` | The application key for Trello | `string` | `"trello-application-key"` |
| `trello_board_id` | The board ID for Trello | `string` | `"trello-board-id"` |
| `trello_list_id` | The list ID for Trello | `string` | `"trello-list-id"` |
| `trello_resolved_list_id` | The resolved list ID for Trello | `string` | `"trello-resolved-list-id"` |
| `trello_text` | The text for Trello | `string` | `"trello-text"` |
| `trello_description` | The description for Trello | `string` | `"trello-description"` |
| `trello_authorization_token` | The authorization token for Trello | `string` | `"trello-authorization-token"` |

### VictorOps Notification Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `victor_ops_active` | Whether the VictorOps notification is

## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)

This resource requires the Jira for Workflows app to be installed via the Dynatrace Hub.

Make sure your API token includes these scopes to successfully create and manage the Dynatrace  resources.