resource "dynatrace_mobile_app_request_errors" "this" {
  for_each = var.mobile_app_request_errors

  scope = each.value.scope

  error_rules {
    dynamic "error_rule" {
      for_each = each.value.error_rules
      content {
        error_codes = error_rule.value.error_codes
      }
    }
  }
}
