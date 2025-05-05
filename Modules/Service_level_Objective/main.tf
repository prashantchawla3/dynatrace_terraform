resource "dynatrace_slo_v2" "example_slo" {
  name               = var.slo_name
  enabled            = var.slo_enabled
  custom_description = var.slo_description
  evaluation_type    = var.slo_evaluation_type
  evaluation_window  = var.slo_evaluation_window
  filter             = var.slo_filter
  metric_expression  = var.slo_metric_expression
  metric_name        = var.slo_metric_name
  target_success     = var.slo_target_success
  target_warning     = var.slo_target_warning
  legacy_id          = var.slo_legacy_id

  dynamic "error_budget_burn_rate" {
    for_each = var.burn_rate_visualization_enabled != null ? [1] : []
    content {
      burn_rate_visualization_enabled = var.burn_rate_visualization_enabled
      fast_burn_threshold             = var.fast_burn_threshold
    }
  }
}

resource "dynatrace_business_events_metrics" "ford_buss_metrics_event" {
  enabled           = true
  key               = "bizevents.easyTrade.TradingVolume"
  matcher           = "matchesValue(event.type, \"com.easytrade.buy-assets\")"
  measure           = "ATTRIBUTE"
  measure_attribute = "trading_volume"
}