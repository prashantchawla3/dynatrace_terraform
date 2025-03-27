output "github_connection_id" {
  description = "The ID of the GitHub connection."
  value       = dynatrace_github_connection.example.id
}

output "gitlab_connection_id" {
  description = "The ID of the GitLab connection."
  value       = dynatrace_gitlab_connection.example.id
}

output "jenkins_connection_id" {
  description = "The ID of the Jenkins connection."
  value       = dynatrace_jenkins_connection.example.id
}

output "ms365_email_connection_id" {
  description = "The ID of the Microsoft 365 email connection."
  value       = dynatrace_ms365_email_connection.example.id
}

output "msentraid_connection_id" {
  description = "The ID of the Microsoft Entra Identity Developer connection."
  value       = dynatrace_msentraid_connection.example.id
}

output "msteams_connection_id" {
  description = "The ID of the Microsoft Teams connection."
  value       = dynatrace_msteams_connection.example.id
}

output "pagerduty_connection_id" {
  description = "The ID of the PagerDuty connection."
  value       = dynatrace_pagerduty_connection.example.id
}

output "servicenow_connection_id" {
  description = "The ID of the ServiceNow connection."
  value       = dynatrace_servicenow_connection.example.id
}