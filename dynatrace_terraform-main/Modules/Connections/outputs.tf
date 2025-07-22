output "jenkins_connection_ids" {
  description = "IDs of Jenkins connections"
  value       = { for k, conn in dynatrace_jenkins_connection.this : k => conn.id }
}

output "github_connection_ids" {
  description = "IDs of GitHub connections"
  value       = { for k, conn in dynatrace_github_connection.this : k => conn.id }
}

output "gitlab_connection_ids" {
  description = "IDs of GitLab connections"
  value       = { for k, conn in dynatrace_gitlab_connection.this : k => conn.id }
}

output "ms365_email_connection_ids" {
  description = "IDs of Microsoft 365 email connections"
  value       = { for k, conn in dynatrace_ms365_email_connection.this : k => conn.id }
}

output "msentraid_connection_ids" {
  description = "IDs of Microsoft Entra ID connections"
  value       = { for k, conn in dynatrace_msentraid_connection.this : k => conn.id }
}

output "msteams_connection_ids" {
  description = "IDs of Microsoft Teams connections"
  value       = { for k, conn in dynatrace_msteams_connection.this : k => conn.id }
}

output "pagerduty_connection_ids" {
  description = "IDs of PagerDuty connections"
  value       = { for k, conn in dynatrace_pagerduty_connection.this : k => conn.id }
}

output "servicenow_connection_ids" {
  description = "IDs of ServiceNow connections"
  value       = { for k, conn in dynatrace_servicenow_connection.this : k => conn.id }
}
