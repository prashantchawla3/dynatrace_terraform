

# ─── Calculated Synthetic Metric ──────────────────────────
module "calculated_synthetic_metric" {
  source  = "./modules/dynatrace_calculated_synthetic_metric"
  count   = var.enable_calculated_synthetic_metric ? 1 : 0

  name                = var.calculated_synthetic_metric_name
  enabled             = var.calculated_synthetic_metric_enabled
  metric              = var.calculated_synthetic_metric_metric
  metric_key          = var.calculated_synthetic_metric_metric_key
  monitor_identifier  = var.calculated_synthetic_metric_monitor_identifier
}

# ─── Synthetic Availability Rule ──────────────────────────
module "synthetic_availability" {
  source  = "./modules/dynatrace_synthetic_availability"
  count   = var.enable_synthetic_availability ? 1 : 0

  exclude_maintenance_windows = var.synthetic_availability_exclude_maintenance_windows
}

# ─── Synthetic Location Configuration ─────────────────────
module "synthetic_location" {
  source  = "./modules/dynatrace_synthetic_location"
  count   = var.enable_synthetic_location ? 1 : 0

  name                                = var.synthetic_location_name
  auto_update_chromium                = var.synthetic_location_auto_update_chromium
  availability_location_outage        = var.synthetic_location_availability_location_outage
  availability_node_outage            = var.synthetic_location_availability_node_outage
  availability_notifications_enabled  = var.synthetic_location_availability_notifications_enabled
  city                                = var.synthetic_location_city
  country_code                        = var.synthetic_location_country_code
  deployment_type                     = var.synthetic_location_deployment_type
  latitude                            = var.synthetic_location_latitude
  longitude                           = var.synthetic_location_longitude
  region_code                         = var.synthetic_location_region_code
  location_node_outage_delay_in_minutes = var.synthetic_location_location_node_outage_delay_in_minutes
}
