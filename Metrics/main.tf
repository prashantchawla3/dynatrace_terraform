
# ─── Custom Units Configuration ────────────────────────────
module "custom_units_name" {
  source             = "./modules/dynatrace_custom_units"
  custom_units_name  = var.custom_units_name
}

module "custom_units_description" {
  source                  = "./modules/dynatrace_custom_units"
  custom_units_description = var.custom_units_description
}

module "custom_units_plural_name" {
  source                   = "./modules/dynatrace_custom_units"
  custom_units_plural_name = var.custom_units_plural_name
}

module "custom_units_symbol" {
  source               = "./modules/dynatrace_custom_units"
  custom_units_symbol  = var.custom_units_symbol
}

# ─── Histogram Bucket Ingest Toggle ───────────────────────
module "histogram_metrics_enable_histogram_bucket_ingest" {
  source                                     = "./modules/dynatrace_histogram_metrics"
  histogram_metrics_enable_histogram_bucket_ingest = var.histogram_metrics_enable_histogram_bucket_ingest
}

# ─── Metric Metadata Configuration ────────────────────────
module "metric_metadata_display_name" {
  source                        = "./modules/dynatrace_metric_metadata"
  metric_metadata_display_name = var.metric_metadata_display_name
}

module "metric_metadata_metric_id" {
  source                      = "./modules/dynatrace_metric_metadata"
  metric_metadata_metric_id  = var.metric_metadata_metric_id
}

module "metric_metadata_unit" {
  source                = "./modules/dynatrace_metric_metadata"
  metric_metadata_unit = var.metric_metadata_unit
}

# ─── Metric Query Configuration ───────────────────────────
module "metric_query_metric_id" {
  source                    = "./modules/dynatrace_metric_query"
  metric_query_metric_id   = var.metric_query_metric_id
}

module "metric_query_metric_selector" {
  source                         = "./modules/dynatrace_metric_query"
  metric_query_metric_selector  = var.metric_query_metric_selector
}
