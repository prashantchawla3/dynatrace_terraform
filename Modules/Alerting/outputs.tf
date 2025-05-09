output "alerting_profile_id" {
  value = dynatrace_alerting_profile.this.id
}

output "maintenance_window_ids" {
  value = { for k, v in dynatrace_maintenance_window.this : k => v.id }
}
