output "connection_ids" {
  value = [for r in dynatrace_automation_controller_connections.connections : r.id]
}
