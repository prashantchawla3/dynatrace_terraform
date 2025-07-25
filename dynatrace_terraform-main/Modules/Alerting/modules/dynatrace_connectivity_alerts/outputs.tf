output "connectivity_alerts_id" {
  description = "ID of the Dynatrace connectivity alerts resource"
  value       = length(dynatrace_connectivity_alerts.this) > 0 ? dynatrace_connectivity_alerts.this[0].id : null
}
