variable "web_app_key_performance_customs" {
  description = "Custom thresholds for generic key performance metrics."
  type = list(object({
    scope = string
    thresholds = optional(object({
      frustrating_threshold_seconds = number
      tolerated_threshold_seconds   = number
    }))
  }))
  default = []
}