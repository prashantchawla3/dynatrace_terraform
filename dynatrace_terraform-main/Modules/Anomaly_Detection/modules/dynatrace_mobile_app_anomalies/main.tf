resource "dynatrace_mobile_app_anomalies" "this" {
  scope = var.mobile_app_anomalies.scope

  dynamic "error_rate_increase" {
    for_each = var.mobile_app_anomalies.error_rate_increase[*]
    content {
      enabled        = error_rate_increase.value.enabled
      detection_mode = error_rate_increase.value.detection_mode

      dynamic "error_rate_increase_fixed" {
        for_each = error_rate_increase.value.error_rate_increase_fixed[*]
        content {
          sensitivity        = error_rate_increase_fixed.value.sensitivity
          threshold_absolute = error_rate_increase_fixed.value.threshold_absolute
        }
      }
    }
  }

  dynamic "slow_user_actions" {
    for_each = var.mobile_app_anomalies.slow_user_actions[*]
    content {
      enabled        = slow_user_actions.value.enabled
      detection_mode = slow_user_actions.value.detection_mode

      dynamic "slow_user_actions_fixed" {
        for_each = slow_user_actions.value.slow_user_actions_fixed[*]
        content {
          sensitivity = slow_user_actions_fixed.value.sensitivity

          dynamic "duration_avoid_overalerting" {
            for_each = slow_user_actions_fixed.value.duration_avoid_overalerting[*]
            content {
              min_action_rate = duration_avoid_overalerting.value.min_action_rate
            }
          }

          dynamic "duration_threshold_all_fixed" {
            for_each = slow_user_actions_fixed.value.duration_threshold_all_fixed[*]
            content {
              duration_threshold = duration_threshold_all_fixed.value.duration_threshold
            }
          }

          dynamic "duration_threshold_slowest" {
            for_each = slow_user_actions_fixed.value.duration_threshold_slowest[*]
            content {
              duration_threshold = duration_threshold_slowest.value.duration_threshold
            }
          }
        }
      }
    }
  }

  dynamic "unexpected_high_load" {
    for_each = var.mobile_app_anomalies.unexpected_high_load[*]
    content {
      enabled              = unexpected_high_load.value.enabled
      threshold_percentage = unexpected_high_load.value.threshold_percentage
    }
  }

  dynamic "unexpected_low_load" {
    for_each = var.mobile_app_anomalies.unexpected_low_load[*]
    content {
      enabled = unexpected_low_load.value.enabled
    }
  }
}
