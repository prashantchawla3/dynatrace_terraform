resource "dynatrace_network_monitor_outage" "this" {
  for_each = var.network_monitor_outages

  global_outages                          = each.value.global_outages
  global_consecutive_outage_count_threshold = each.value.global_consecutive_outage_count_threshold
  local_outages                           = each.value.local_outages
  local_consecutive_outage_count_threshold = each.value.local_consecutive_outage_count_threshold
  local_location_outage_count_threshold   = each.value.local_location_outage_count_threshold
}
