output "github_connection_ids" {
  description = "IDs of GitHub connections"
  value       = { for k, conn in dynatrace_github_connection.this : k => conn.id }
}