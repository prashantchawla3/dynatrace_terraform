output "msentraid_connection_ids" {
  description = "IDs of Microsoft Entra ID connections"
  value       = { for k, conn in dynatrace_msentraid_connection.this : k => conn.id }
}
