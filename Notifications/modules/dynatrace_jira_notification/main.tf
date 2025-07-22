resource "dynatrace_jira_notification" "jira" {
  active      = var.jira_active
  name        = var.jira_name
  profile     = dynatrace_alerting.Default.id
  url         = var.jira_url
  username    = var.jira_username
  api_token   = var.jira_api_token
  project_key = var.jira_project_key
  issue_type  = var.jira_issue_type
  summary     = var.jira_summary
  description = var.jira_description
}
