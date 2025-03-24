resource "dynatrace_custom_units" "example" {
  name        = var.custom_units_name
  description = var.custom_units_description
  plural_name = var.custom_units_plural_name
  symbol      = var.custom_units_symbol
}

resource "dynatrace_histogram_metrics" "example" {
  enable_histogram_bucket_ingest = var.histogram_metrics_enable_histogram_bucket_ingest
}

resource "dynatrace_metric_metadata" "example" {
  display_name = var.metric_metadata_display_name
  metric_id    = var.metric_metadata_metric_id
  unit         = var.metric_metadata_unit
}

resource "dynatrace_metric_query" "example" {
  metric_id       = var.metric_query_metric_id
  metric_selector = var.metric_query_metric_selector
}