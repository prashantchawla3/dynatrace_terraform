variable "mobile_app_anomalies" {
  description = "Mobile app anomaly detection configuration keyed by rule name"
  type = object({
    scope = string

    error_rate_increase = list(object({
      enabled        = bool
      detection_mode = string

      error_rate_increase_fixed = list(object({
        sensitivity        = string
        threshold_absolute = number
      }))
    }))

    slow_user_actions = list(object({
      enabled        = bool
      detection_mode = string

      slow_user_actions_fixed = list(object({
        sensitivity = string

        duration_avoid_overalerting = list(object({
          min_action_rate = number
        }))

        duration_threshold_all_fixed = list(object({
          duration_threshold = number
        }))

        duration_threshold_slowest = list(object({
          duration_threshold = number
        }))
      }))
    }))

    unexpected_high_load = list(object({
      enabled              = bool
      threshold_percentage = number
    }))

    unexpected_low_load = list(object({
      enabled = bool
    }))
  })
  default = {
    scope = "MOBILE_APP_SCOPE_PLACEHOLDER"

    error_rate_increase = [{
      enabled        = true
      detection_mode = "FIXED"
      error_rate_increase_fixed = [{
        sensitivity        = "HIGH"
        threshold_absolute = 10
      }]
    }]

    slow_user_actions = [{
      enabled        = true
      detection_mode = "FIXED"
      slow_user_actions_fixed = [{
        sensitivity = "MEDIUM"

        duration_avoid_overalerting = [{
          min_action_rate = 3
        }]

        duration_threshold_all_fixed = [{
          duration_threshold = 1200
        }]

        duration_threshold_slowest = [{
          duration_threshold = 1800
        }]
      }]
    }]

    unexpected_high_load = [{
      enabled              = true
      threshold_percentage = 60
    }]

    unexpected_low_load = [{
      enabled = false
    }]
  }
}
