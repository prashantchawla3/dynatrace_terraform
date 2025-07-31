output "slack_connection_id" {
  description = "The ID of the Slack connection"
  value       = dynatrace_automation_workflow_slack.slack.id
}

output "slack_connection_name" {
  description = "The name of the Slack connection"
  value       = dynatrace_automation_workflow_slack.slack.name
}
