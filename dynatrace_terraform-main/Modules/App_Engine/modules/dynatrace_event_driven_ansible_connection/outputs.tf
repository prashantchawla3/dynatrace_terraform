output "ansible_connection_names" {
  description = "List of names for the created Ansible connections"
  value       = dynatrace_event_driven_ansible_connections.ansible_connections[*].name
}
