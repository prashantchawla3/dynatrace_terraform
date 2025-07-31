output "infraops_app_settings_ids" {
  description = "List of resource IDs for the InfraOps app settings"
  value       = dynatrace_infraops_app_settings.infraops_settings[*].id
}
