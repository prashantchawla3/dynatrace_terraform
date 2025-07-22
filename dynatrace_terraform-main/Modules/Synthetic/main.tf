module "calculated_synthetic_metric" {
  source = "./modules/dynatrace_calculated_synthetic_metric"

  enable_calculated_synthetic_metric         = var.enable_calculated_synthetic_metric
  calculated_synthetic_metric_name           = var.calculated_synthetic_metric_name
  calculated_synthetic_metric_enabled        = var.calculated_synthetic_metric_enabled
  calculated_synthetic_metric_metric         = var.calculated_synthetic_metric_metric
  calculated_synthetic_metric_metric_key     = var.calculated_synthetic_metric_metric_key
  calculated_synthetic_metric_monitor_identifier = var.calculated_synthetic_metric_monitor_identifier
}

module "synthetic_availability" {
  source = "./modules/dynatrace_synthetic_availability"

  enable_synthetic_availability = var.enable_synthetic_availability
  synthetic_availability_exclude_maintenance_windows = var.synthetic_availability_exclude_maintenance_windows
}

module "synthetic_location" {
  source = "./modules/dynatrace_synthetic_location"

  enable_synthetic_location                              = var.enable_synthetic_location
  synthetic_location_name                                = var.synthetic_location_name
  synthetic_location_auto_update_chromium               = var.synthetic_location_auto_update_chromium
  synthetic_location_availability_location_outage       = var.synthetic_location_availability_location_outage
  synthetic_location_availability_node_outage           = var.synthetic_location_availability_node_outage
  synthetic_location_availability_notifications_enabled = var.synthetic_location_availability_notifications_enabled
  synthetic_location_city                                = var.synthetic_location_city
  synthetic_location_country_code                        = var.synthetic_location_country_code
  synthetic_location_deployment_type                    = var.synthetic_location_deployment_type
  synthetic_location_latitude                            = var.synthetic_location_latitude
  synthetic_location_location_node_outage_delay_in_minutes = var.synthetic_location_location_node_outage_delay_in_minutes
  synthetic_location_longitude                           = var.synthetic_location_longitude
  synthetic_location_region_code                         = var.synthetic_location_region_code
}
