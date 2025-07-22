resource "dynatrace_http_monitor_outage" "outage" {
  count = var.enable_outage_monitoring ? 1 : 0

  global_consecutive_outage_count_threshold = var.global_consecutive_outage_count_threshold
  global_outages                            = var.global_outages
  local_consecutive_outage_count_threshold  = var.local_consecutive_outage_count_threshold
  local_location_outage_count_threshold     = var.local_location_outage_count_threshold
  local_outages                             = var.local_outages
  scope                                     = var.outage_scope
}
