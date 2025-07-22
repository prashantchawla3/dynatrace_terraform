output "alerting_profile_name" {
  description = "The name of the Dynatrace alerting profile"
  value       = dynatrace_alerting.this.name
}