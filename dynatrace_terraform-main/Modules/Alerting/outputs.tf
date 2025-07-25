output "alerting_profile_id" {
  description = "ID of the created Dynatrace alerting profile"
  value       = module.alerting_profile.alerting_profile_id
}

output "alerting_profile_name" {
  description = "Name of the Dynatrace alerting profile"
  value       = module.alerting_profile.alerting_profile_name
}

output "connectivity_alerts_id" {
  description = "ID of the Dynatrace connectivity alerts resource"
  value       = var.enable_connectivity_alerts ? module.connectivity_alerts[0].connectivity_alerts_id : null
}


output "maintenance_id" {
  description = "ID of the Dynatrace maintenance window"
  value       = module.maintenance_window.maintenance_id
}

output "maintenance_name" {
  description = "Name of the Dynatrace maintenance window"
  value       = module.maintenance_window.maintenance_name
}
