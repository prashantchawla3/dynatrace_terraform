output "servicenow_connection_ids" {
  description = "IDs of ServiceNow connections"
  value       = { for k, conn in dynatrace_servicenow_connection.this : k => conn.id }
}
