output "maintenance_window_name" {
  description = "The name of the maintenance window"
  value       = dynatrace_maintenance.this.general_properties[0].name
}
