resource "dynatrace_application_error_rules" "app_error_rules" {
  count              = length(var.app_error_rules)
  web_application_id = var.app_error_rules[count.index].web_application_id

  dynamic "custom_errors" {
    for_each = var.app_error_rules[count.index].custom_errors != null ? [var.app_error_rules[count.index].custom_errors] : []
    content {
      rule {
        capture         = custom_errors.value.capture
        custom_alerting = custom_errors.value.custom_alerting
        impact_apdex    = custom_errors.value.impact_apdex
        key_matcher     = custom_errors.value.key_matcher
        key_pattern     = custom_errors.value.key_pattern
        value_matcher   = custom_errors.value.value_matcher
        value_pattern   = custom_errors.value.value_pattern
      }
    }
  }

  dynamic "http_errors" {
    for_each = var.app_error_rules[count.index].http_errors != null ? [var.app_error_rules[count.index].http_errors] : []
    content {
      rule {
        capture                     = http_errors.value.capture
        consider_blocked_requests   = http_errors.value.consider_blocked_requests
        consider_for_ai             = http_errors.value.consider_for_ai
        consider_unknown_error_code = http_errors.value.consider_unknown_error_code
        error_codes                 = http_errors.value.error_codes
        filter                      = http_errors.value.filter
        filter_by_url               = http_errors.value.filter_by_url
        impact_apdex                = http_errors.value.impact_apdex
        url                         = http_errors.value.url
      }
    }
  }
}
