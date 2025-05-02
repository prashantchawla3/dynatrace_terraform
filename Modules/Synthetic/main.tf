resource "dynatrace_calculated_synthetic_metric" "example" {
  count              = var.enable_calculated_synthetic_metric ? 1 : 0
  name               = var.calculated_synthetic_metric_name
  enabled            = var.calculated_synthetic_metric_enabled
  metric             = var.calculated_synthetic_metric_metric
  metric_key         = var.calculated_synthetic_metric_metric_key
  monitor_identifier = var.calculated_synthetic_metric_monitor_identifier
}

resource "dynatrace_synthetic_availability" "example" {
  count                        = var.enable_synthetic_availability ? 1 : 0
  exclude_maintenance_windows = var.synthetic_availability_exclude_maintenance_windows
}

resource "dynatrace_synthetic_location" "example" {
  count                                  = var.enable_synthetic_location ? 1 : 0
  name                                   = var.synthetic_location_name
  auto_update_chromium                   = var.synthetic_location_auto_update_chromium
  availability_location_outage           = var.synthetic_location_availability_location_outage
  availability_node_outage               = var.synthetic_location_availability_node_outage
  availability_notifications_enabled     = var.synthetic_location_availability_notifications_enabled
  city                                   = var.synthetic_location_city
  country_code                           = var.synthetic_location_country_code
  deployment_type                        = var.synthetic_location_deployment_type
  latitude                               = var.synthetic_location_latitude
  location_node_outage_delay_in_minutes = var.synthetic_location_location_node_outage_delay_in_minutes
  longitude                              = var.synthetic_location_longitude
  region_code                            = var.synthetic_location_region_code
}
