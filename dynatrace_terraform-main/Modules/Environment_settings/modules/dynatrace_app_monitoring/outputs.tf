output "app_monitoring_levels" {
  value = [
    for r in var.app_monitoring_resources : {
      log_level   = r.settings.app_monitoring.default_log_level
      trace_level = r.settings.app_monitoring.default_trace_level
    }
  ]
}