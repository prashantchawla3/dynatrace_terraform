resource "dynatrace_web_app_custom_errors" "web_app_custom_errors" {
  count                                     = length(var.web_app_custom_errors)
  ignore_custom_errors_in_apdex_calculation = var.web_app_custom_errors[count.index].ignore_custom_errors_in_apdex_calculation
  scope                                     = var.web_app_custom_errors[count.index].scope

  dynamic "error_rules" {
    for_each = var.web_app_custom_errors[count.index].error_rules != null ? [var.web_app_custom_errors[count.index].error_rules] : []
    content {
      error_rule {
        key_matcher   = error_rules.value.key_matcher
        key_pattern   = error_rules.value.key_pattern
        value_matcher = error_rules.value.value_matcher
        value_pattern = error_rules.value.value_pattern

        dynamic "capture_settings" {
          for_each = error_rules.value.capture_settings != null ? [error_rules.value.capture_settings] : []
          content {
            capture         = capture_settings.value.capture
            consider_for_ai = capture_settings.value.consider_for_ai
            impact_apdex    = capture_settings.value.impact_apdex
          }
        }
      }
    }
  }
}
