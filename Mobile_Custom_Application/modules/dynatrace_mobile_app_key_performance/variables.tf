variable "mobile_app_key_performance" {
  description = "Performance thresholds and scope configuration for mobile apps."
  type = map(object({
    frustrating_if_reported_or_web_request_error = bool
    scope                                        = string
    thresholds = object({
      frustrating_threshold_seconds = number
      tolerable_threshold_seconds   = number
    })
  }))
  default = {
    perf1 = {
      frustrating_if_reported_or_web_request_error = true
      scope = "APP:MOBILE"
      thresholds = {
        frustrating_threshold_seconds = 8
        tolerable_threshold_seconds   = 4
      }
    }
  }
}