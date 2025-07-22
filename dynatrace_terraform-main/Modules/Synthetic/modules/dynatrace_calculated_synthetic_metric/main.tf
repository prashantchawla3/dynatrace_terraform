resource "dynatrace_calculated_synthetic_metric" "example" {
  count              = var.enable_calculated_synthetic_metric ? 1 : 0
  name               = var.calculated_synthetic_metric_name
  enabled            = var.calculated_synthetic_metric_enabled
  metric             = var.calculated_synthetic_metric_metric
  metric_key         = var.calculated_synthetic_metric_metric_key
  monitor_identifier = var.calculated_synthetic_metric_monitor_identifier
}
