resource "dynatrace_web_app_key_performance_custom" "web_app_key_performance_custom" {
  count = length(var.web_app_key_performance_customs)
  scope = var.web_app_key_performance_customs[count.index].scope

  dynamic "thresholds" {
    for_each = var.web_app_key_performance_customs[count.index].thresholds != null ? [var.web_app_key_performance_customs[count.index].thresholds] : []
    content {
      frustrating_threshold_seconds = thresholds.value.frustrating_threshold_seconds
      tolerated_threshold_seconds   = thresholds.value.tolerated_threshold_seconds
    }
  }
}
