resource "dynatrace_network_monitor_outage" "network_monitor_outage" {
  global_outages                          = var.network_monitor_outage_global_outages
  global_consecutive_outage_count_threshold = var.network_monitor_outage_global_consecutive_outage_count_threshold
  local_outages                           = var.network_monitor_outage_local_outages
  local_consecutive_outage_count_threshold = var.network_monitor_outage_local_consecutive_outage_count_threshold
  local_location_outage_count_threshold   = var.network_monitor_outage_local_location_outage_count_threshold
  scope                                   = var.network_monitor_outage_scope
}