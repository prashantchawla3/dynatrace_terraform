output "automation_controller_connection_names" {
  description = "List of names for the created Dynatrace automation controller connections"
  value       = dynatrace_automation_controller_connections.connections[*].name
}

output "automation_controller_connection_urls" {
  description = "List of URLs for the created Dynatrace automation controller connections"
  value       = dynatrace_automation_controller_connections.connections[*].url
}

output "automation_controller_connection_types" {
  description = "List of types for the created Dynatrace automation controller connections"
  value       = dynatrace_automation_controller_connections.connections[*].type
}
