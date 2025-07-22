output "default_dashboard_ids" {
  description = "List of default dashboard IDs"
  value       = [for d in var.default_dashboards : d.dashboard]
}