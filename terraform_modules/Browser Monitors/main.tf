resource "dynatrace_browser_monitor" "example" {
  name                   = var.browser_monitor_name
  frequency              = var.browser_monitor_frequency
  locations              = var.browser_monitor_locations
  manually_assigned_apps = var.browser_monitor_manually_assigned_apps
  anomaly_detection {
    loading_time_thresholds {
      enabled = var.browser_monitor_loading_time_thresholds_enabled
    }
    outage_handling {
      global_outage  = var.browser_monitor_outage_handling_global_outage
      retry_on_error = var.browser_monitor_outage_handling_retry_on_error
      global_outage_policy {
        consecutive_runs = var.browser_monitor_outage_handling_global_outage_policy_consecutive_runs
      }
    }
  }
  key_performance_metrics {
    load_action_kpm = var.browser_monitor_load_action_kpm
    xhr_action_kpm  = var.browser_monitor_xhr_action_kpm
  }
  script {
    type = var.browser_monitor_script_type
    configuration {
      bypass_csp = var.browser_monitor_script_configuration_bypass_csp
      user_agent = var.browser_monitor_script_configuration_user_agent
      bandwidth {
        network_type = var.browser_monitor_script_configuration_bandwidth_network_type
      }
      device {
        name        = var.browser_monitor_script_configuration_device_name
        orientation = var.browser_monitor_script_configuration_device_orientation
      }
      headers {
        header {
          name  = var.browser_monitor_script_configuration_headers_name
          value = var.browser_monitor_script_configuration_headers_value
        }
      }
      ignored_error_codes {
        status_codes = var.browser_monitor_script_configuration_ignored_error_codes_status_codes
      }
      javascript_setttings {
        timeout_settings {
          action_limit  = var.browser_monitor_script_configuration_javascript_settings_timeout_settings_action_limit
          total_timeout = var.browser_monitor_script_configuration_javascript_settings_timeout_settings_total_timeout
        }
        visually_complete_options {
          image_size_threshold = var.browser_monitor_script_configuration_javascript_settings_visually_complete_options_image_size_threshold
          inactivity_timeout   = var.browser_monitor_script_configuration_javascript_settings_visually_complete_options_inactivity_timeout
          mutation_timeout     = var.browser_monitor_script_configuration_javascript_settings_visually_complete_options_mutation_timeout
        }
      }
    }
    events {
      event {
        description = var.browser_monitor_script_events_description
        navigate {
          url = var.browser_monitor_script_events_navigate_url
          authentication {
            type  = var.browser_monitor_script_events_navigate_authentication_type
            creds = var.browser_monitor_script_events_navigate_authentication_creds
          }
          wait {
            wait_for = var.browser_monitor_script_events_navigate_wait_wait_for
          }
        }
      }
      event {
        description = var.browser_monitor_script_events_description_2
        navigate {
          url = var.browser_monitor_script_events_navigate_url_2
          authentication {
            type  = var.browser_monitor_script_events_navigate_authentication_type_2
            creds = var.browser_monitor_script_events_navigate_authentication_creds_2
          }
          validate {
            validation {
              type  = var.browser_monitor_script_events_navigate_validate_validation_type
              match = var.browser_monitor_script_events_navigate_validate_validation_match
              regex = var.browser_monitor_script_events_navigate_validate_validation_regex
              target {
                window = var.browser_monitor_script_events_navigate_validate_validation_target_window
              }
            }
          }
          wait {
            timeout  = var.browser_monitor_script_events_navigate_wait_timeout
            wait_for = var.browser_monitor_script_events_navigate_wait_wait_for_2
            validation {
              type  = var.browser_monitor_script_events_navigate_wait_validation_type
              match = var.browser_monitor_script_events_navigate_wait_validation_match
              target {
                locators {
                  locator {
                    type  = var.browser_monitor_script_events_navigate_wait_validation_target_locators_locator_type
                    value = var.browser_monitor_script_events_navigate_wait_validation_target_locators_locator_value
                  }
                }
              }
            }
          }
        }
      }
      event {
        description = var.browser_monitor_script_events_description_3
        click {
          button = var.browser_monitor_script_events_click_button
          validate {
            validation {
              type = var.browser_monitor_script_events_click_validate_validation_type
            }
          }
          wait {
            wait_for = var.browser_monitor_script_events_click_wait_wait_for
          }
        }
      }
      event {
        description = var.browser_monitor_script_events_description_4
        javascript {
          code = var.browser_monitor_script_events_javascript_code
          wait {
            wait_for = var.browser_monitor_script_events_javascript_wait_wait_for
          }
        }
      }
    }
  }
}

resource "dynatrace_browser_monitor_outage" "example" {
  global_consecutive_outage_count_threshold = var.browser_monitor_outage_global_consecutive_outage_count_threshold
  global_outages                            = var.browser_monitor_outage_global_outages
  local_consecutive_outage_count_threshold  = var.browser_monitor_outage_local_consecutive_outage_count_threshold
  local_location_outage_count_threshold     = var.browser_monitor_outage_local_location_outage_count_threshold
  local_outages                             = var.browser_monitor_outage_local_outages
  retry_on_error                            = var.browser_monitor_outage_retry_on_error
  scope                                     = var.browser_monitor_outage_scope
}

resource "dynatrace_browser_monitor_performance" "example" {
  enabled = var.browser_monitor_performance_enabled
  scope   = var.browser_monitor_performance_scope
  thresholds {
    threshold {
      event     = var.browser_monitor_performance_thresholds_event
      threshold = var.browser_monitor_performance_thresholds_threshold
    }
  }
}