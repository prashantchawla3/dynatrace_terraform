
# ─── Synthetic Network Monitors ───────────────────────────
module "network_monitor" {
  for_each = var.network_monitors

  source = "./modules/dynatrace_network_monitor"

  name           = each.value.name
  description    = each.value.description
  type           = each.value.type
  enabled        = each.value.enabled
  frequency_min  = each.value.frequency_min
  locations      = each.value.locations

  outage_handling              = each.value.outage_handling
  performance_thresholds       = each.value.performance_thresholds
  steps                        = each.value.steps
  tags                         = each.value.tags
}

# ─── Outage Configuration per Monitor ─────────────────────
module "network_monitor_outage" {
  for_each = var.network_monitor_outages

  source = "./modules/dynatrace_network_monitor_outage"

  global_outages                          = each.value.global_outages
  global_consecutive_outage_count_threshold = each.value.global_consecutive_outage_count_threshold
  local_outages                           = each.value.local_outages
  local_consecutive_outage_count_threshold = each.value.local_consecutive_outage_count_threshold
  local_location_outage_count_threshold   = each.value.local_location_outage_count_threshold
}
