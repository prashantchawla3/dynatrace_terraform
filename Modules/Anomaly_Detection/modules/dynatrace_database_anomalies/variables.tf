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
