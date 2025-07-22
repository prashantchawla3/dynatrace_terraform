resource "dynatrace_network_monitor" "DNS_Test" {
  name          = var.network_monitor_name
  description   = var.network_monitor_description
  type          = var.network_monitor_type
  enabled       = var.network_monitor_enabled
  frequency_min = var.network_monitor_frequency_min
  locations     = var.network_monitor_locations

  outage_handling {
    global_consecutive_outage_count_threshold = var.network_monitor_global_consecutive_outage_count_threshold
    global_outages                            = var.network_monitor_global_outages
  }

  performance_thresholds {
    enabled = var.network_monitor_performance_thresholds_enabled
    thresholds {
      threshold {
        aggregation        = var.network_monitor_threshold_aggregation
        dealerting_samples = var.network_monitor_threshold_dealerting_samples
        samples            = var.network_monitor_threshold_samples
        step_index         = var.network_monitor_threshold_step_index
        threshold          = var.network_monitor_threshold_value
        violating_samples  = var.network_monitor_threshold_violating_samples
      }
    }
  }

  steps {
    step {
      name         = var.network_monitor_step_name
      request_type = var.network_monitor_step_request_type
      target_list  = var.network_monitor_step_target_list
      properties   = var.network_monitor_step_properties

      constraints {
        constraint {
          type       = var.network_monitor_step_constraint_type
          properties = var.network_monitor_step_constraint_properties
        }
      }

      request_configurations {
        request_configuration {
          constraints {
            constraint {
              type       = var.network_monitor_step_request_constraint_type
              properties = var.network_monitor_step_request_constraint_properties
            }
          }
        }
      }
    }
  }

  tags {
    tag {
      context = var.network_monitor_tag_context
      key     = var.network_monitor_tag_key
      source  = var.network_monitor_tag_source
      value   = var.network_monitor_tag_value
    }
  }
}