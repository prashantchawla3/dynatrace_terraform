resource "dynatrace_dashboards_presets" "this" {
  enable_dashboard_presets = var.enable_dashboard_presets

  dashboard_presets_list {
    dynamic "dashboard_presets" {
      for_each = var.dashboard_presets
      content {
        dashboard_preset = dashboard_presets.value.dashboard_preset
        user_group       = dashboard_presets.value.user_group
      }
    }
  }
}
