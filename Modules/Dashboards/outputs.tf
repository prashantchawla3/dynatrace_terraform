output "dashboard_ids" {
  description = "List of Dynatrace dashboard IDs"
  value = [for dashboard in dynatrace_json_dashboard.this : dashboard.id]
}

output "dashboard_names" {
  description = "List of Dynatrace dashboard names"
  value = [for dashboard in dynatrace_json_dashboard.this : dashboard.name]
}

output "dashboard_management_zones" {
  description = "List of Dynatrace dashboard management zones"
  value = [for dashboard in dynatrace_json_dashboard.this : dashboard.management_zone]
}
