variable "web_app_key_performance_xhrs" {
  description = "Performance metric thresholds for XHR calls with fallback logic."
  type = list(object({
    kpm   = string
    scope = string
    thresholds = optional(object({
      frustrating_threshold_seconds = number
      tolerated_threshold_seconds   = number
    }))
    fallback_thresholds = optional(object({
      frustrating_fallback_threshold_seconds = number
      tolerated_fallback_threshold_seconds   = number
    }))
  }))
  default = []
}
