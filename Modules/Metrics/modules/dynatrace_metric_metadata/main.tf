resource "dynatrace_metric_metadata" "example" {
  display_name = var.metric_metadata_display_name
  metric_id    = var.metric_metadata_metric_id
  unit         = var.metric_metadata_unit
}