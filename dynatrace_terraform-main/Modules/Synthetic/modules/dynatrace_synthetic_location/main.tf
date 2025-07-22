resource "dynatrace_synthetic_location" "example" {
  count                                 = var.enable_synthetic_location ? 1 : 0
  name                                  = var.synthetic_location_name
  auto_update_chromium                  = var.synthetic_location_auto_update_chromium
  availability_location_outage          = var.synthetic_location_availability_location_outage
  availability_node_outage              = var.synthetic_location_availability_node_outage
  availability_notifications_enabled    = var.synthetic_location_availability_notifications_enabled
  city                                  = var.synthetic_location_city
  country_code                          = var.synthetic_location_country_code
  deployment_type                       = var.synthetic_location_deployment_type
  latitude                              = var.synthetic_location_latitude
  location_node_outage_delay_in_minutes = var.synthetic_location_location_node_outage_delay_in_minutes
  longitude                             = var.synthetic_location_longitude
  region_code                           = var.synthetic_location_region_code
}
