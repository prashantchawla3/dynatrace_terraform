output "infraops_setting_ids" {
  value = [for r in dynatrace_infraops_app_settings.infraops_settings : r.id]
}