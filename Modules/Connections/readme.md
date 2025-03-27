# Dynatrace Terraform Module

This Terraform module manages various Dynatrace connections including GitHub, GitLab, Jenkins, Microsoft 365 Email, Microsoft Entra Identity Developer, Microsoft Teams, PagerDuty, and ServiceNow. It includes configurations for these connections along with necessary variables and outputs.

## Table of Contents

- Dynatrace Terraform Module
  - Table of Contents
  - Usage
  - Requirements
  - Providers
  - Resources
  - Inputs
  - Outputs
  - Example

## Usage

To use this module, include it in your Terraform configuration and provide the necessary variables. Below is an example of how to use this module:

```hcl
module "dynatrace_connections" {
  source = "./path_to_module"

  github_connection_name = var.github_connection_name
  github_connection_token = var.github_connection_token
  gitlab_connection_name = var.gitlab_connection_name
  gitlab_connection_url = var.gitlab_connection_url
  gitlab_connection_token = var.gitlab_connection_token
  jenkins_connection_name = var.jenkins_connection_name
  jenkins_connection_url = var.jenkins_connection_url
  jenkins_connection_username = var.jenkins_connection_username
  jenkins_connection_password = var.jenkins_connection_password
  ms365_email_connection_name = var.ms365_email_connection_name
  ms365_email_connection_tenant_id = var.ms365_email_connection_tenant_id
  ms365_email_connection_client_id = var.ms365_email_connection_client_id
  ms365_email_connection_client_secret = var.ms365_email_connection_client_secret
  ms365_email_connection_from_address = var.ms365_email_connection_from_address
  msentraid_connection_name = var.msentraid_connection_name
  msentraid_connection_directory_id = var.msentraid_connection_directory_id
  msentraid_connection_application_id = var.msentraid_connection_application_id
  msentraid_connection_client_secret = var.msentraid_connection_client_secret
  msentraid_connection_description = var.msentraid_connection_description
  msteams_connection_name = var.msteams_connection_name
  msteams_connection_webhook = var.msteams_connection_webhook
  msteams_connection_channel_name = var.msteams_connection_channel_name
  msteams_connection_team_name = var.msteams_connection_team_name
  pagerduty_connection_name = var.pagerduty_connection_name
  pagerduty_connection_url = var.pagerduty_connection_url
  pagerduty_connection_token = var.pagerduty_connection_token
  servicenow_connection_name = var.servicenow_connection_name
  servicenow_connection_url = var.servicenow_connection_url
  servicenow_connection_type = var.servicenow_connection_type
  servicenow_connection_user = var.servicenow_connection_user
  servicenow_connection_password = var.servicenow_connection_password
}
```

## Requirements

- Terraform >= 0.12
- Dynatrace provider >= 1.0

## Providers

| Name      | Version |
|-----------|---------|
| dynatrace | ~> 1.0  |

## Resources

| Name                                                                 | Type     |
|----------------------------------------------------------------------|----------|
| dynatrace_github_connection.example            | Resource |
| dynatrace_gitlab_connection.example            | Resource |
| dynatrace_jenkins_connection.example          | Resource |
| dynatrace_ms365_email_connection.example  | Resource |
| dynatrace_msentraid_connection.example      | Resource |
| dynatrace_msteams_connection.example          | Resource |
| dynatrace_pagerduty_connection.example      | Resource |
| dynatrace_servicenow_connection.example    | Resource |

### GitHub Connection

```hcl
resource "dynatrace_github_connection" "example" {
  name = var.github_connection_name
  type = "pat"
  token = var.github_connection_token
}
```

### GitLab Connection

```hcl
resource "dynatrace_gitlab_connection" "example" {
  name = var.gitlab_connection_name
  url = var.gitlab_connection_url
  token = var.gitlab_connection_token
}
```

### Jenkins Connection

```hcl
resource "dynatrace_jenkins_connection" "example" {
  name = var.jenkins_connection_name
  url = var.jenkins_connection_url
  username = var.jenkins_connection_username
  password = var.jenkins_connection_password
}
```

### Microsoft 365 Email Connection

```hcl
resource "dynatrace_ms365_email_connection" "example" {
  name = var.ms365_email_connection_name
  type = "client_secret"
  tenant_id = var.ms365_email_connection_tenant_id
  client_id = var.ms365_email_connection_client_id
  client_secret = var.ms365_email_connection_client_secret
  from_address = var.ms365_email_connection_from_address
}
```

### Microsoft Entra Identity Developer Connection

```hcl
resource "dynatrace_msentraid_connection" "example" {
  name = var.msentraid_connection_name
  directory_id = var.msentraid_connection_directory_id
  application_id = var.msentraid_connection_application_id
  client_secret = var.msentraid_connection_client_secret
  description = var.msentraid_connection_description
}
```

### Microsoft Teams Connection

```hcl
resource "dynatrace_msteams_connection" "example" {
  name = var.msteams_connection_name
  webhook = var.msteams_connection_webhook
  channel_name = var.msteams_connection_channel_name
  team_name = var.msteams_connection_team_name
}
```

### PagerDuty Connection

```hcl
resource "dynatrace_pagerduty_connection" "example" {
  name = var.pagerduty_connection_name
  url = var.pagerduty_connection_url
  token = var.pagerduty_connection_token
}
```

### ServiceNow Connection

```hcl
resource "dynatrace_servicenow_connection" "example" {
  name = var.servicenow_connection_name
  url = var.servicenow_connection_url
  type = var.servicenow_connection_type
  user = var.servicenow_connection_user
  password = var.servicenow_connection_password
}
```

## Inputs

| Name                                          | Description                                                                 | Type         | Default             |
|-----------------------------------------------|-----------------------------------------------------------------------------|--------------|---------------------|
| github_connection_name                        | The name of the GitHub connection.                                          | `string`     | `"example-github-connection"` |
| github_connection_token                       | Token for the selected authentication type.                                 | `string`     | `"your-github-token"` |
| gitlab_connection_name                        | A unique and clearly identifiable connection name to your GitLab instance.  | `string`     | `"example-gitlab-connection"` |
| gitlab_connection_url                         | The GitLab URL instance you want to connect. For example, https://gitlab.com | `string`     | `"https://gitlab.com"` |
| gitlab_connection_token                       | The GitLab token to use for authentication. Please note that this token is not refreshed and can expire. | `string`     | `"your-gitlab-token"` |
| jenkins_connection_name                       | The name of the Jenkins connection.                                         | `string`     | `"example-jenkins-connection"` |
| jenkins_connection_url                        | Base URL of your Jenkins instance (e.g. https://[YOUR_JENKINS_DOMAIN]/).    | `string`     | `"https://jenkins.example.com"` |
| jenkins_connection_username                   | The name of your Jenkins user (e.g. jenkins).                               | `string`     | `"jenkins-user"`    |
| jenkins_connection_password                   | The password of the user or API token obtained from the Jenkins UI (Dashboard > User > Configure > API Token). | `string`     | `"your-jenkins-password"` |
| ms365_email_connection_name                   | A unique name for the Microsoft 365 email connection.                       | `string`     | `"example-ms365-email-connection"` |
| ms365_email_connection_tenant_id              | Directory (tenant) ID of your Azure Active Directory.                       | `string`     | `"123e4567-e89b-12d3-a456-426614174000"` |
| ms365_email_connection_client_id              | Application (client) ID of your app registered in Microsoft Azure App registrations. | `string`     | `"123e4567-e89b-12d3-a456-426614174000"` |
| ms365_email_connection_client_secret          | Client secret of your app registered in Microsoft Azure App registrations.  | `string`     | `"your-ms365-client-secret"` |
| ms365_email_connection_from_address           | The email address from which the messages will be sent.                     | `string`     | `"random.email@terraform.com"` |
| msentraid_connection_name                     | The name of the Microsoft Entra Identity Developer connection.              | `string`     | `"example