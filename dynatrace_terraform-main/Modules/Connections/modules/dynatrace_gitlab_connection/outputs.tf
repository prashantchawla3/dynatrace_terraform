output "gitlab_connection_ids" {
  description = "IDs of GitLab connections"
  value       = { for k, conn in dynatrace_gitlab_connection.this : k => conn.id }
}
