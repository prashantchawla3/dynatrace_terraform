resource "dynatrace_infraops_app_settings" "infraops_settings" {
  count                          = var.infraops_settings_count
  show_monitoring_candidates     = var.infraops_show_monitoring_candidates
  show_standalone_hosts          = var.infraops_show_standalone_hosts
  interface_saturation_threshold = var.infraops_interface_saturation_threshold
}
