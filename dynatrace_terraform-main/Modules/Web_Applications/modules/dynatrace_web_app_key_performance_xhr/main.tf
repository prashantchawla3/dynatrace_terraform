resource "dynatrace_web_app_key_performance_xhr" "web_app_key_performance_xhr" {
  count = length(var.web_app_key_performance_xhrs)
  kpm   = var.web_app_key_performance_xhrs[count.index].kpm
  scope = var.web_app_key_performance_xhrs[count.index].scope

  dynamic "thresholds" {
    for_each = var.web_app_key_performance_xhrs[count.index].thresholds != null ? [var.web_app_key_performance_xhrs[count.index].thresholds] : []
    content {
      frustrating_threshold_seconds = thresholds.value.frustrating_threshold_seconds
      tolerated_threshold_seconds   = thresholds.value.tolerated_threshold_seconds
    }
  }

  dynamic "fallback_thresholds" {
    for_each = var.web_app_key_performance_xhrs[count.index].fallback_thresholds != null ? [var.web_app_key_performance_xhrs[count.index].fallback_thresholds] : []
    content {
      frustrating_fallback_threshold_seconds = fallback_thresholds.value.frustrating_fallback_threshold_seconds
      tolerated_fallback_threshold_seconds   = fallback_thresholds.value.tolerated_fallback_threshold_seconds
    }
  }
}
