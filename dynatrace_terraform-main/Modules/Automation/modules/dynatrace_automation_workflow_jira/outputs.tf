output "jira_connection_id" {
  description = "The ID of the Jira connection"
  value       = dynatrace_automation_workflow_jira.jira.id
}

output "jira_connection_name" {
  description = "The name of the Jira connection"
  value       = dynatrace_automation_workflow_jira.jira.name
}

output "jira_connection_type" {
  description = "The type of the Jira connection"
  value       = dynatrace_automation_workflow_jira.jira.type
}

output "jira_connection_url" {
  description = "The URL of the Jira instance"
  value       = dynatrace_automation_workflow_jira.jira.url
}

output "jira_connection_user" {
  description = "The user configured for the Jira connection"
  value       = dynatrace_automation_workflow_jira.jira.user
}
