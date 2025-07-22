variable "custom_app_scope" {
  description = "Scope tag for application-specific anomaly detection"
  type        = string
  default     = ""
}

variable "error_rate_increase" {
  description = "Configuration for detecting increases in application error rates"
  type        = object({
    enabled                     = bool
    detection_mode              = string
    error_rate_increase_fixed = object({
      sensitivity        = string
      threshold_absolute = number
    })
  })
  default = null
}

variable "slow_user_actions" {
  description = "Detects slow end-user interaction times in application services"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "unexpected_high_load" {
  description = "Detects unusually high load spikes in traffic or resource usage"
  type        = object({
    enabled              = bool
    threshold_percentage = number
  })
  default = null
}

variable "unexpected_low_load" {
  description = "Detects unusually low load drops in traffic or resource usage"
  type        = object({
    enabled              = bool
    threshold_percentage = number
  })
  default = null
}