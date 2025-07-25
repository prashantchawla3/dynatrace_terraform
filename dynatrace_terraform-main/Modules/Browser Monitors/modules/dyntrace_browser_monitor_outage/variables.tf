variable "global_outages" {
  description = "Enable or disable detection of global outages"
  type        = bool
  default     = false
}

variable "local_outages" {
  description = "Enable or disable detection of local outages"
  type        = bool
  default     = false
}

variable "retry_on_error" {
  description = "Retry synthetic monitor execution on error before reporting outage"
  type        = bool
  default     = false
}

variable "global_consecutive_outage_count_threshold" {
  description = "Threshold for consecutive global outages to trigger an alert"
  type        = number
  default     = null
}

variable "local_consecutive_outage_count_threshold" {
  description = "Threshold for consecutive local outages to trigger an alert"
  type        = number
  default     = null
}

variable "local_location_outage_count_threshold" {
  description = "Minimum number of affected locations required for a local outage alert"
  type        = number
  default     = null
}
