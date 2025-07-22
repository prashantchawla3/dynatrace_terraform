output "alerting_profile_name" {
  description = "The name of the Dynatrace alerting profile"
  value       = dynatrace_alerting.this.name
}

output "connectivity_alerts_enabled" {
  description = "Whether connectivity alerts are enabled"
  value       = var.enable_connectivity_alerts ? dynatrace_connectivity_alerts.this[0].connectivity_alerts : null
}

output "maintenance_window_name" {
  description = "The name of the maintenance window"
  value       = dynatrace_maintenance.this.general_properties[0].name
}
