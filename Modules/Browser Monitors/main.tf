# Create one browser monitor for each entry in var.browser_monitors
resource "dynatrace_browser_monitor" "monitor" {
  for_each = { for bm in var.browser_monitors : bm.name => bm }

  name        = each.key
  enabled     = lookup(each.value, "enabled", true)
  frequency   = each.value.frequency
  locations   = lookup(each.value, "locations", [])
  tags        = lookup(each.value, "tags", [])
  # Set device profile (screen width, height, etc.) if specified
  dynamic "device_profile" {
    for_each = lookup(each.value, "device_profile", []) 
    content {
      screen_width  = device_profile.value.screen_width
      screen_height = device_profile.value.screen_height
      user_agent    = device_profile.value.user_agent
      # additional fields if any
    }
  }
  # Key performance metrics block (non-repeatable)
  dynamic "key_performance_metrics" {
    for_each = lookup(each.value, "key_performance_metrics", []) 
    content {
      load_action_kpm = key_performance_metrics.value.load_action_kpm
      xhr_action_kpm  = key_performance_metrics.value.xhr_action_kpm
      # Can add more KPM fields if supported
    }
  }
  # Optional anomaly detection configuration
  dynamic "anomaly_detection" {
    for_each = lookup(each.value, "anomaly_detection", [])
    content {
      enabled = anomaly_detection.value.enabled
      # Additional anomaly fields can be added here
    }
  }

  # Script block (clickpath or availability test)
  dynamic "script" {
    for_each = lookup(each.value, "script", [])
    content {
      type = script.value.type  # e.g., "clickpath" or "single-url"
      # Iterate through script events
      dynamic "events" {
        for_each = script.value.events
        content {
          event {
            description = events.value.description
            # Navigate event
            dynamic "navigate" {
              for_each = lookup(events.value, "navigate", []) 
              content {
                url = navigate.value.url
                dynamic "wait" {
                  for_each = lookup(navigate.value, "wait", [])
                  content {
                    wait_for = wait.value.wait_for
                    timeout  = wait.value.timeout
                  }
                }
              }
            }
            # Click event
            dynamic "click" {
              for_each = lookup(events.value, "click", [])
              content {
                target {
                  # Locator(s) for the click target
                  dynamic "locators" {
                    for_each = click.value.target.locators
                    content {
                      locator {
                        type  = locators.value.type
                        value = locators.value.value
                      }
                    }
                  }
                }
                dynamic "wait" {
                  for_each = lookup(click.value, "wait", [])
                  content {
                    wait_for = wait.value.wait_for
                    timeout  = wait.value.timeout
                  }
                }
              }
            }
            # Keystrokes event
            dynamic "keystrokes" {
              for_each = lookup(events.value, "keystrokes", [])
              content {
                text = keystrokes.value.text
                target {
                  dynamic "locators" {
                    for_each = keystrokes.value.target.locators
                    content {
                      locator {
                        type  = locators.value.type
                        value = locators.value.value
                      }
                    }
                  }
                }
                # Validation after keystroke (optional)
                dynamic "validate" {
                  for_each = lookup(keystrokes.value, "validate", [])
                  content {
                    validation {
                      type         = validate.value.type
                      fail_if_found = validate.value.fail_if_found
                      ignore_case  = validate.value.ignore_case
                      # ... other validation fields ...
                    }
                  }
                }
              }
            }
            # Additional event types (e.g., javascript, navigate-back) can be added similarly
          }
        }
      }
    }
  }
}

# Optional outage settings for each monitor
resource "dynatrace_browser_monitor_outage" "outage" {
  for_each = dynatrace_browser_monitor.monitor

  monitor_id                            = each.value.id
  global_outages                        = lookup(each.value, "global_outages", null)
  local_outages                         = lookup(each.value, "local_outages", null)
  retry_on_error                        = lookup(each.value, "retry_on_error", null)
  global_consecutive_outage_count_threshold = lookup(each.value, "global_consecutive_outage_count_threshold", null)
  local_consecutive_outage_count_threshold  = lookup(each.value, "local_consecutive_outage_count_threshold", null)
  local_location_outage_count_threshold    = lookup(each.value, "local_location_outage_count_threshold", null)
  # If you want to use scope (SYNTHETIC_TEST), you can include it here; omit for global
}

# Optional performance threshold settings for each monitor
resource "dynatrace_browser_monitor_performance" "performance" {
  for_each = dynatrace_browser_monitor.monitor

  monitor_id = each.value.id
  enabled    = lookup(each.value, "performance_enabled", false)
  scope      = lookup(each.value, "performance_scope", null)  # e.g. "SYNTHETIC_TEST"
  dynamic "thresholds" {
    for_each = lookup(each.value, "performance_thresholds", [])
    content {
      event     = thresholds.value.event    # e.g. "LOAD"
      threshold = thresholds.value.threshold
    }
  }
}
