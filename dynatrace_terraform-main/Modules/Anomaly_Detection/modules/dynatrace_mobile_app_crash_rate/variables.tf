variable "mobile_app_crash_rate" {
  description = "Configuration for crash rate anomaly detection in mobile applications"
  type = object({
    application_id = string

    crash_rate_increase = list(object({
      enabled        = bool
      detection_mode = string

      crash_rate_increase_fixed = list(object({
        absolute_crash_rate = number
        concurrent_users    = number
      }))
    }))
  })
  default = {
    application_id = "MOBILE_APP_123"

    crash_rate_increase = [{
      enabled        = true
      detection_mode = "FIXED"

      crash_rate_increase_fixed = [{
        absolute_crash_rate = 0.15
        concurrent_users    = 1000
      }]
    }]
  }
}
