output "ms365_email_connection_ids" {
  description = "IDs of Microsoft 365 email connections"
  value       = { for k, conn in dynatrace_ms365_email_connection.this : k => conn.id }
}
