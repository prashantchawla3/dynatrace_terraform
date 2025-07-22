
variable "metrics_enabled" {
  description = "Enable or disable the business events metrics"
  type        = bool
  default     = true
}

variable "metrics_key" {
  description = "Key for the business events metric"
  type        = string
  default     = "metric.event.key"
}

variable "metrics_matcher" {
  description = "Matcher expression for the metric"
  type        = string
  default     = "eventType == \"transaction\""
}