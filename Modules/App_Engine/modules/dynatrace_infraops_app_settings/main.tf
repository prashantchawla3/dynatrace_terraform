resource "dynatrace_infraops_app_settings" "infraops_settings" {
  count                        = var.resource_count
  show_monitoring_candidates   = var.show_monitoring_candidates
  show_standalone_hosts        = var.show_standalone_hosts
  interface_saturation_threshold = var.interface_saturation_threshold
}