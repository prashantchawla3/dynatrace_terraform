resource "dynatrace_github_connection" "example" {
  name  = var.github_connection_name
  type  = "pat"
  token = var.github_connection_token
}

resource "dynatrace_gitlab_connection" "example" {
  name  = var.gitlab_connection_name
  url   = var.gitlab_connection_url
  token = var.gitlab_connection_token
}

resource "dynatrace_jenkins_connection" "example" {
  name     = var.jenkins_connection_name
  url      = var.jenkins_connection_url
  username = var.jenkins_connection_username
  password = var.jenkins_connection_password
}

resource "dynatrace_ms365_email_connection" "example" {
  name          = var.ms365_email_connection_name
  type          = "client_secret"
  tenant_id     = var.ms365_email_connection_tenant_id
  client_id     = var.ms365_email_connection_client_id
  client_secret = var.ms365_email_connection_client_secret
  from_address  = var.ms365_email_connection_from_address
}

resource "dynatrace_msentraid_connection" "example" {
  name           = var.msentraid_connection_name
  directory_id   = var.msentraid_connection_directory_id
  application_id = var.msentraid_connection_application_id
  client_secret  = var.msentraid_connection_client_secret
  description    = var.msentraid_connection_description
}

resource "dynatrace_msteams_connection" "example" {
  name         = var.msteams_connection_name
  webhook      = var.msteams_connection_webhook
  channel_name = var.msteams_connection_channel_name
  team_name    = var.msteams_connection_team_name
}

resource "dynatrace_pagerduty_connection" "example" {
  name  = var.pagerduty_connection_name
  url   = var.pagerduty_connection_url
  token = var.pagerduty_connection_token
}

resource "dynatrace_servicenow_connection" "example" {
  name     = var.servicenow_connection_name
  url      = var.servicenow_connection_url
  type     = var.servicenow_connection_type
  user     = var.servicenow_connection_user
  password = var.servicenow_connection_password
}