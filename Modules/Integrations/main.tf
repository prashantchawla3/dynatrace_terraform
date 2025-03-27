
resource "dynatrace_issue_tracking" "this" {
  enabled            = var.issue_tracking_enabled
  issuelabel         = var.issue_tracking_issuelabel
  issuequery         = var.issue_tracking_issuequery
  issuetheme         = var.issue_tracking_issuetheme
  issuetrackersystem = var.issue_tracking_issuetrackersystem
  token              = var.issue_tracking_token
  url                = var.issue_tracking_url
  username           = var.issue_tracking_username

  # Optional
  insert_after = var.issue_tracking_insert_after
  password     = var.issue_tracking_password
}

resource "dynatrace_remote_environments" "this" {
  name          = var.remote_environment_name
  network_scope = var.remote_environment_network_scope
  token         = var.remote_environment_token
  uri           = var.remote_environment_uri
}