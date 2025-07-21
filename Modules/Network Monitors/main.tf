
# ─── Core Network Monitor Configuration ─────────────────────
module "network_monitor" {
  source                                        = "./modules/dynatrace_network_monitor"

  network_monitor_name                          = var.network_monitor_name
  network_monitor_description                   = var.network_monitor_description
  network_monitor_type                          = var.network_monitor_type
  network_monitor_enabled                       = var.network_monitor_enabled
  network_monitor_frequency_min                 = var.network_monitor_frequency_min
  network_monitor_locations                     = var.network_monitor_locations

  network_monitor_performance_thresholds_enabled = var.network_monitor_performance_thresholds_enabled
  network_monitor_threshold_aggregation          = var.network_monitor_threshold_aggregation
  network_monitor_threshold_dealerting_samples   = var.network_monitor_threshold_dealerting_samples
  network_monitor_threshold_samples              = var.network_monitor_threshold_samples
  network_monitor_threshold_step_index           = var.network_monitor_threshold_step_index
  network_monitor_threshold_value                = var.network_monitor_threshold_value
  network_monitor_threshold_violating_samples    = var.network_monitor_threshold_violating_samples

  network_monitor_step_name                      = var.network_monitor_step_name
  network_monitor_step_request_type              = var.network_monitor_step_request_type
  network_monitor_step_target_list               = var.network_monitor_step_target_list
  network_monitor_step_properties                = var.network_monitor_step_properties
  network_monitor_step_constraint_type           = var.network_monitor_step_constraint_type
  network_monitor_step_constraint_properties     = var.network_monitor_step_constraint_properties
  network_monitor_step_request_constraint_type   = var.network_monitor_step_request_constraint_type
  network_monitor_step_request_constraint_properties = var.network_monitor_step_request_constraint_properties

  network_monitor_tag_context                    = var.network_monitor_tag_context
  network_monitor_tag_key                        = var.network_monitor_tag_key
  network_monitor_tag_source                     = var.network_monitor_tag_source
  network_monitor_tag_value                      = var.network_monitor_tag_value
}

# ─── Outage Thresholds Configuration ────────────────────────
module "network_monitor_outage" {
  source                                                        = "./modules/dynatrace_network_monitor_outage"

  network_monitor_global_outages                                = var.network_monitor_global_outages
  network_monitor_global_consecutive_outage_count_threshold     = var.network_monitor_global_consecutive_outage_count_threshold

  network_monitor_outage_global_outages                         = var.network_monitor_outage_global_outages
  network_monitor_outage_global_consecutive_outage_count_threshold = var.network_monitor_outage_global_consecutive_outage_count_threshold

  network_monitor_outage_local_outages                          = var.network_monitor_outage_local_outages
  network_monitor_outage_local_consecutive_outage_count_threshold = var.network_monitor_outage_local_consecutive_outage_count_threshold
  network_monitor_outage_local_location_outage_count_threshold  = var.network_monitor_outage_local_location_outage_count_threshold
  network_monitor_outage_scope                                  = var.network_monitor_outage_scope
}
