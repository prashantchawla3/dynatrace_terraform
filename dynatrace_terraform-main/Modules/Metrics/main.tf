
module "custom_units" {
  source                   = "./modules/dynatrace_custom_units"
  custom_units_name        = var.custom_units_name
  custom_units_description = var.custom_units_description
  custom_units_plural_name = var.custom_units_plural_name
  custom_units_symbol      = var.custom_units_symbol
}

module "histogram_metrics" {
  source                                     = "./modules/dynatrace_histogram_metrics"
  histogram_metrics_enable_histogram_bucket_ingest = var.histogram_metrics_enable_histogram_bucket_ingest
}


module "metric_metadata" {
  source                   = "./modules/dynatrace_metric_metadata"
  metric_metadata_display_name = var.metric_metadata_display_name
  metric_metadata_metric_id    = var.metric_metadata_metric_id
  metric_metadata_unit         = var.metric_metadata_unit
}

module "metric_query" {
  source                        = "./modules/dynatrace_metric_query"
  metric_query_metric_id        = var.metric_query_metric_id
  metric_query_metric_selector  = var.metric_query_metric_selector
}
