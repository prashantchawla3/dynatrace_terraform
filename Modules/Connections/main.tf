resource "dynatrace_jenkins_connection" "this" {
  for_each = { for conn in var.jenkins_connections : conn.name => conn }
  name     = each.value.name
  url      = each.value.url
  username = each.value.username
  password = each.value.password
}
resource "dynatrace_github_connection" "this" {
  for_each = { for conn in var.github_connections : conn.name => conn }
  name  = each.value.name
  type  = each.value.type
  token = each.value.token
}

resource "dynatrace_gitlab_connection" "this" {
  for_each = { for conn in var.gitlab_connections : conn.name => conn }
  name  = each.value.name
  url   = each.value.url
  token = each.value.token
}

resource "dynatrace_ms365_email_connection" "this" {
  for_each = { for conn in var.ms365_email_connections : conn.name => conn }
  name          = each.value.name
  client_id     = each.value.client_id
  tenant_id     = each.value.tenant_id
  from_address  = each.value.from_address
  type          = each.value.type
  client_secret = each.value.client_secret
}

resource "dynatrace_msentraid_connection" "this" {
  for_each = { for conn in var.msentraid_connections : conn.name => conn }
  name           = each.value.name
  application_id = each.value.application_id
  directory_id   = each.value.directory_id
  client_secret  = each.value.client_secret
  description    = each.value.description
}

resource "dynatrace_msteams_connection" "this" {
  for_each = { for conn in var.msteams_connections : conn.name => conn }
  name         = each.value.name
  webhook      = each.value.webhook
  team_name    = lookup(each.value, "team_name", null)
  channel_name = lookup(each.value, "channel_name", null)
}

resource "dynatrace_pagerduty_connection" "this" {
  for_each = { for conn in var.pagerduty_connections : conn.name => conn }
  name  = each.value.name
  token = each.value.token
  url   = each.value.url
}

resource "dynatrace_servicenow_connection" "this" {
  for_each = { for conn in var.servicenow_connections : conn.name => conn }
  name     = each.value.name
  url      = each.value.url
  type     = each.value.type
  user     = lookup(each.value, "user", null)
  password = lookup(each.value, "password", null)
}
