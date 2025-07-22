output "remote_environment_id" {
  description = "ID of the created remote environment configuration"
  value       = dynatrace_remote_environments.this.id
}