output "json_dashboard_ids" {
  description = "List of Dynatrace JSON dashboard IDs"
  value       = [for d in dynatrace_json_dashboard.this : d.id]
}