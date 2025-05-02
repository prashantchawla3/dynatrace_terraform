variable "browser_monitors" {
  description = "List of Dynatrace browser monitors to create. Each object includes all settings."
  type = list(object({
    name       = string
    frequency  = number
    enabled    = optional(bool, true)
    locations  = optional(list(string), [])
    tags       = optional(list(string), [])
    # Device profile settings (screen, UA)
    device_profile = optional(object({
      screen_width  = number
      screen_height = number
      user_agent    = optional(string)
      # ... other profile fields ...
    }), null)
    # Key performance metrics settings
    key_performance_metrics = optional(object({
      load_action_kpm = string
      xhr_action_kpm  = string
    }), null)
    # Anomaly detection (optional)
    anomaly_detection = optional(object({
      enabled = bool
      # ... more anomaly fields ...
    }), null)
    # Synthetic script (clickpath or single-URL)
    script = optional(list(object({
      type   = string
      events = list(object({
        description = optional(string)
        navigate = optional(object({
          url = string
          wait = optional(object({
            wait_for = string
            timeout  = number
          }), null)
        }), null)
        click = optional(object({
          target = object({
            locators = list(object({ type = string, value = string }))
          })
          wait = optional(object({
            wait_for = string
            timeout  = number
          }), null)
        }), null)
        keystrokes = optional(object({
          text   = string
          target = object({
            locators = list(object({ type = string, value = string }))
          })
          validate = optional(object({
            type          = string
            fail_if_found = bool
            ignore_case   = bool
            # ... additional validate fields ...
          }), null)
        }), null)
        # ... other event types (javascript, navigate-back, etc.) ...
      }))
    })), null)
    # Outage settings (optional object; null means none)
    outage = optional(object({
      global_outages                           = optional(bool)
      local_outages                            = optional(bool)
      retry_on_error                           = optional(bool)
      global_consecutive_outage_count_threshold = optional(number)
      local_consecutive_outage_count_threshold  = optional(number)
      local_location_outage_count_threshold     = optional(number)
      # scope can be added if needed: scope = optional(string)
    }), null)
    # Performance settings (optional)
    performance = optional(object({
      enabled    = bool
      scope      = optional(string)
      thresholds = optional(list(object({
        event     = string
        threshold = number
      })), [])
    }), null)
  }))
}
