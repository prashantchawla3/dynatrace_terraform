variable "network_monitor_outage_global_outages" {
  description = "Enable global outage logic scoped to synthetic monitor"
  type        = bool
  default     = true
}

variable "network_monitor_outage_global_consecutive_outage_count_threshold" {
  description = "Number of global failures to trigger outage event"
  type        = number
  default     = 3
}

variable "network_monitor_outage_local_outages" {
  description = "Enable local outage logic (per-location)"
  type        = bool
  default     = true
}

variable "network_monitor_outage_local_consecutive_outage_count_threshold" {
  description = "Failed runs per location required for local outage"
  type        = number
  default     = 2
}

variable "network_monitor_outage_local_location_outage_count_threshold" {
  description = "Number of failing locations needed to declare local outage"
  type        = number
  default     = 1
}

variable "network_monitor_outage_scope" {
  description = "Scope of outage evaluation (e.g., 'monitor-group:web')")
  type        = string
  default     = "monitor-group:network"
}
