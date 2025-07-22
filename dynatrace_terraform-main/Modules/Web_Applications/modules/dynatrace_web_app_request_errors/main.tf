resource "dynatrace_web_app_request_errors" "web_app_request_errors" {
  count                                      = length(var.web_app_request_errors)
  ignore_request_errors_in_apdex_calculation = var.web_app_request_errors[count.index].ignore_request_errors_in_apdex_calculation
  scope                                      = var.web_app_request_errors[count.index].scope

  dynamic "error_rules" {
    for_each = var.web_app_request_errors[count.index].error_rules != null ? [var.web_app_request_errors[count.index].error_rules] : []
    content {
      error_rule {
        consider_csp_violations = error_rules.value.consider_csp_violations
        consider_failed_images  = error_rules.value.consider_failed_images
        error_codes             = error_rules.value.error_codes

        dynamic "capture_settings" {
          for_each = error_rules.value.capture_settings != null ? [error_rules.value.capture_settings] : []
          content {
            capture         = capture_settings.value.capture
            consider_for_ai = capture_settings.value.consider_for_ai
            impact_apdex    = capture_settings.value.impact_apdex
          }
        }

        dynamic "filter_settings" {
          for_each = error_rules.value.filter_settings != null ? [error_rules.value.filter_settings] : []
          content {
            filter = filter_settings.value.filter
            url    = filter_settings.value.url
          }
        }
      }
    }
  }
}
