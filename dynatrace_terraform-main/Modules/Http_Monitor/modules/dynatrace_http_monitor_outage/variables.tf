variable "enable_outage_monitoring" {
  description = "Whether to enable global outage monitoring logic"
  type        = bool
  default     = true
}

variable "global_consecutive_outage_count_threshold" {
  description = "Number of consecutive failed runs before triggering global outage"
  type        = number
  default     = 3
}

variable "global_outages" {
  description = "Enable global outage detection"
  type        = bool
  default     = true
}

variable "local_consecutive_outage_count_threshold" {
  description = "Number of consecutive failed runs at location before declaring local outage"
  type        = number
  default     = 2
}

variable "local_location_outage_count_threshold" {
  description = "Number of locations required to fail before declaring a local outage"
  type        = number
  default     = 1
}

variable "local_outages" {
  description = "Enable local outage detection"
  type        = bool
  default     = true
}

variable "outage_scope" {
  description = "Scope to which outage rules apply (e.g., 'monitor-group:frontend')"
  type        = string
  default     = "monitor-group:global"
}