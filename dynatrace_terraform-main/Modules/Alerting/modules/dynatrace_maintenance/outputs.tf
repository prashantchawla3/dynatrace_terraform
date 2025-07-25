output "maintenance_id" {
  value       = dynatrace_maintenance.this.id
  description = "ID of the Dynatrace maintenance window"
}

output "maintenance_name" {
  value       = dynatrace_maintenance.this.general_properties[0].name
  description = "Name of the Dynatrace maintenance window"
}
