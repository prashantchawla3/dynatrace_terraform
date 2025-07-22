resource "dynatrace_app_monitoring" "this" {
  for_each = {
    for r in var.resources : r.name => r
    if r.type == "app_monitoring" && r.settings.app_monitoring != null
  }

  default_log_level   = each.value.settings.app_monitoring.default_log_level
  default_trace_level = each.value.settings.app_monitoring.default_trace_level
}
