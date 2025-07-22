resource "dynatrace_http_monitor_performance" "performance" {
  count   = length(var.performance_monitors)
  enabled = var.performance_monitors[count.index].enabled
  scope   = var.performance_monitors[count.index].scope

  dynamic "thresholds" {
    for_each = try([var.performance_monitors[count.index]], [])
    content {
      dynamic "threshold" {
        for_each = thresholds.value.thresholds
        content {
          event     = threshold.value.event
          threshold = threshold.value.threshold
        }
      }
    }
  }
}
