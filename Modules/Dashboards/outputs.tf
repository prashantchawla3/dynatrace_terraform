output "json_dashboard_ids" {
  description = "List of Dynatrace JSON dashboard IDs"
  value       = [for d in dynatrace_json_dashboard.this : d.id]
}

output "default_dashboard_ids" {
  description = "List of default dashboard IDs"
  value       = [for d in var.default_dashboards : d.dashboard]
}
