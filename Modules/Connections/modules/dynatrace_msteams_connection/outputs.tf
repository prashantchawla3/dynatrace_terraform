output "msteams_connection_ids" {
  description = "IDs of Microsoft Teams connections"
  value       = { for k, conn in dynatrace_msteams_connection.this : k => conn.id }
}
