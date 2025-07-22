output "issue_tracking_id" {
  description = "ID of the created issue tracking configuration"
  value       = dynatrace_issue_tracking.this.id
}

output "remote_environment_id" {
  description = "ID of the created remote environment configuration"
  value       = dynatrace_remote_environments.this.id
}