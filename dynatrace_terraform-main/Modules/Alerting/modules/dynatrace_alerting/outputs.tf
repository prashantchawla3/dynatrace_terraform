output "alerting_profile_id" {
  value       = dynatrace_alerting.this.id
  description = "ID of the Dynatrace alerting profile"
}

output "alerting_profile_name" {
  value       = dynatrace_alerting.this.name
  description = "Name of the Dynatrace alerting profile"
}
