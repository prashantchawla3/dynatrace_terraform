output "connectivity_alerts_enabled" {
  description = "Whether connectivity alerts are enabled"
  value       = var.enable_connectivity_alerts ? dynatrace_connectivity_alerts.this[0].connectivity_alerts : null
}