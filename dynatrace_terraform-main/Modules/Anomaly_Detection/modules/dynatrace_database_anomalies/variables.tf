
variable "database_scope" {
  description = "Scope tag for database anomaly detection"
  type        = string
  default     = ""
}

variable "database_connections" {
  description = "Detects anomalies in database connection behaviors"
  type        = object({
    enabled             = bool
    max_failed_connects = number
    time_period         = number
  })
  default = null
}

variable "failure_rate" {
  description = "Detects high failure rates in application or infrastructure behavior"
  type        = object({
    enabled         = bool
    detection_mode  = string
    fixed_detection = object({
      sensitivity = string
      threshold   = number
      over_alerting_protection = object({
        minutes_abnormal_state = number
        requests_per_minute    = number
      })
    })
  })
  default = null
}

variable "load_drops" {
  description = "Detects sharp drops in load or traffic patterns"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "load_spikes" {
  description = "Detects sharp spikes in load or traffic patterns"
  type        = object({
    enabled = bool
  })
  default = null
}

variable "response_time" {
  description = "Detects degradation in application or service response times"
  type        = object({
    enabled         = bool
    detection_mode  = string
    fixed_detection = object({
      sensitivity = string
      over_alerting_protection = object({
        minutes_abnormal_state = number
        requests_per_minute    = number
      })
      response_time_all = object({
        degradation_milliseconds = number
      })
      response_time_slowest = object({
        slowest_degradation_milliseconds = number
      })
    })
  })
  default = null
}