output "dashboard_presets_enabled" {
  description = "Whether dashboard presets are enabled"
  value       = dynatrace_dashboards_presets.this.enable_dashboard_presets
}

output "dashboard_presets_assignments" {
  description = "List of dashboard presets and their assigned user groups"
  value = [
    for preset in dynatrace_dashboards_presets.this.dashboard_presets_list[0].dashboard_presets : {
      dashboard_preset = preset.dashboard_preset
      user_group       = preset.user_group
    }
  ]
}
