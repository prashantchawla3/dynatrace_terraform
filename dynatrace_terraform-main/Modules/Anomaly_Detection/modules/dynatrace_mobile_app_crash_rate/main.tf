resource "dynatrace_mobile_app_crash_rate" "this" {
  application_id = var.mobile_app_crash_rate.application_id

  dynamic "crash_rate_increase" {
    for_each = var.mobile_app_crash_rate.crash_rate_increase[*]
    content {
      enabled        = crash_rate_increase.value.enabled
      detection_mode = crash_rate_increase.value.detection_mode

      dynamic "crash_rate_increase_fixed" {
        for_each = crash_rate_increase.value.crash_rate_increase_fixed[*]
        content {
          absolute_crash_rate = crash_rate_increase_fixed.value.absolute_crash_rate
          concurrent_users    = crash_rate_increase_fixed.value.concurrent_users
        }
      }
    }
  }
}