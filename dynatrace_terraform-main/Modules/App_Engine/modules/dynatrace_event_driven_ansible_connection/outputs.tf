output "ansible_connection_ids" {
  value = [for r in dynatrace_event_driven_ansible_connections.ansible_connections : r.id]
}