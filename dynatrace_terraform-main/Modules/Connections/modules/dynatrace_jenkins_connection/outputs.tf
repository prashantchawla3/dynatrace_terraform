output "jenkins_connection_ids" {
  description = "IDs of Jenkins connections"
  value       = { for k, conn in dynatrace_jenkins_connection.this : k => conn.id }
}
