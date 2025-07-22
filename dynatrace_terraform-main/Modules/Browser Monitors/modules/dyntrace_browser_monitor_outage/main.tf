
resource "dynatrace_browser_monitor_outage" "outage" {
  for_each = dynatrace_browser_monitor.monitor

  scope          = dynatrace_browser_monitor.monitor[each.key].id
  global_outages = lookup(each.value, "global_outages", false)
  local_outages  = lookup(each.value, "local_outages", false)
  retry_on_error = lookup(each.value, "retry_on_error", false)

  global_consecutive_outage_count_threshold = lookup(each.value, "global_consecutive_outage_count_threshold", null)
  local_consecutive_outage_count_threshold  = lookup(each.value, "local_consecutive_outage_count_threshold", null)
  local_location_outage_count_threshold     = lookup(each.value, "local_location_outage_count_threshold", null)
}
