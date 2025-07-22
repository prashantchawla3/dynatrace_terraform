resource "dynatrace_custom_app_anomalies" "this" {
  scope = var.custom_app_scope

  dynamic "error_rate_increase" {
    for_each = var.error_rate_increase != null ? [var.error_rate_increase] : []
    content {
      enabled        = error_rate_increase.value.enabled
      detection_mode = error_rate_increase.value.detection_mode
      error_rate_increase_fixed {
        sensitivity        = error_rate_increase.value.error_rate_increase_fixed.sensitivity
        threshold_absolute = error_rate_increase.value.error_rate_increase_fixed.threshold_absolute
      }
    }
  }

  dynamic "slow_user_actions" {
    for_each = var.slow_user_actions != null ? [var.slow_user_actions] : []
    content {
      enabled = slow_user_actions.value.enabled
    }
  }

  dynamic "unexpected_high_load" {
    for_each = var.unexpected_high_load != null ? [var.unexpected_high_load] : []
    content {
      enabled              = unexpected_high_load.value.enabled
      threshold_percentage = unexpected_high_load.value.threshold_percentage
    }
  }

  dynamic "unexpected_low_load" {
    for_each = var.unexpected_low_load != null ? [var.unexpected_low_load] : []
    content {
      enabled              = unexpected_low_load.value.enabled
      threshold_percentage = unexpected_low_load.value.threshold_percentage
    }
  }
}
