resource "dynatrace_metric_query" "example" {
  metric_id       = var.metric_query_metric_id
  metric_selector = var.metric_query_metric_selector
}