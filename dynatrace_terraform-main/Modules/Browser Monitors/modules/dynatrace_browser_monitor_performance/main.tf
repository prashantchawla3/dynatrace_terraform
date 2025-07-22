resource "dynatrace_browser_monitor_performance" "performance" {
  for_each = dynatrace_browser_monitor.monitor

  scope = replace(dynatrace_browser_monitor.monitor[each.key].id, "SYNTHETIC_TEST", "SYNTHETIC_MONITOR")

  enabled = lookup(each.value, "performance_enabled", false)

  thresholds {
    threshold {
      event     = lookup(each.value, "performance_event", "LOAD")
      threshold = lookup(each.value, "performance_threshold", 3000)
    }
  }
}