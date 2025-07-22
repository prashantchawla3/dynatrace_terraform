output "jira_active" {
  description = "Indicates whether the Jira notification is active"
  value       = var.jira_active
}

output "jira_name" {
  description = "Name of the Jira notification"
  value       = var.jira_name
}

output "jira_url" {
  description = "URL of the Jira instance"
  value       = var.jira_url
}

output "jira_username" {
  description = "Username for Jira authentication"
  value       = var.jira_username
}

output "jira_api_token" {
  description = "API token for Jira authentication"
  value       = var.jira_api_token
}

output "jira_project_key" {
  description = "Project key in Jira where issues will be created"
  value       = var.jira_project_key
}

output "jira_issue_type" {
  description = "Type of issue to be created in Jira"
  value       = var.jira_issue_type
}

output "jira_summary" {
  description = "Summary of the Jira issue"
  value       = var.jira_summary
}

output "jira_description" {
  description = "Description of the Jira issue"
  value       = var.jira_description
}
