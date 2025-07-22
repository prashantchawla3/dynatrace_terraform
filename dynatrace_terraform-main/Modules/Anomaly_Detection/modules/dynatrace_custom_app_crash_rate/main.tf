resource "dynatrace_custom_app_crash_rate" "this" {
  scope = var.custom_app_scope

  dynamic "crash_rate_increase" {
    for_each = var.crash_rate_increase != null ? [var.crash_rate_increase] : []
    content {
      enabled        = crash_rate_increase.value.enabled
      detection_mode = crash_rate_increase.value.detection_mode
      crash_rate_increase_fixed {
        absolute_crash_rate = crash_rate_increase.value.crash_rate_increase_fixed.absolute_crash_rate
        concurrent_users    = crash_rate_increase.value.crash_rate_increase_fixed.concurrent_users
      }
    }
  }
}