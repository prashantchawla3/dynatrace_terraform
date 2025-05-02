# Exported IDs for created resources
output "alerting_profile_id" {
  description = "ID of the Dynatrace alerting profile"
  value       = dynatrace_alerting.this.id
}
output "alerting_profile_legacy_id" {
  description = "Legacy ID of the Dynatrace alerting profile (for older APIs)"
  value       = dynatrace_alerting.this.legacy_id
}

output "connectivity_alerts_ids" {
  description = "Map of connectivity alert resource IDs (by key)"
  value       = { for k, v in dynatrace_connectivity_alerts.this : k => v.id }
}

output "maintenance_window_ids" {
  description = "Map of maintenance window resource IDs (by key)"
  value       = { for k, v in dynatrace_maintenance.this : k => v.id }
}
