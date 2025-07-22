variable "network_monitor_outages" {
  description = "Map of outage thresholds scoped by monitor ID, including global and local conditions."
  type = map(object({
    global_outages                          = bool
    global_consecutive_outage_count_threshold = number
    local_outages                           = bool
    local_consecutive_outage_count_threshold = number
    local_location_outage_count_threshold   = number
  }))
  default = {
    ping_global = {
      global_outages                          = true
      global_consecutive_outage_count_threshold = 3
      local_outages                           = true
      local_consecutive_outage_count_threshold = 2
      local_location_outage_count_threshold   = 1
    }
  }
}
