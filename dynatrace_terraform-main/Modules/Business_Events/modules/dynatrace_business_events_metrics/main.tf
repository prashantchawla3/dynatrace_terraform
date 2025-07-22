resource "dynatrace_business_events_metrics" "this" {
  enabled           = var.metrics_enabled
  key               = var.metrics_key
  matcher           = var.metrics_matcher
  measure           = var.measure
  measure_attribute = var.measure_attribute
}