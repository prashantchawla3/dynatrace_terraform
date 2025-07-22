variable "web_applications" {
  description = "Map of web application configurations to be created."
  type = map(object({
    name                                 = string
    type                                 = string
    cost_control_user_session_percentage = number
    load_action_key_performance_metric   = string
    real_user_monitoring_enabled         = bool
    xhr_action_key_performance_metric    = string

    custom_action_apdex_settings = object({
      frustrating_fallback_threshold = number
      frustrating_threshold          = number
      tolerated_fallback_threshold   = number
      tolerated_threshold            = number
    })

    load_action_apdex_settings = object({
      frustrating_fallback_threshold = number
      frustrating_threshold          = number
      tolerated_fallback_threshold   = number
      tolerated_threshold            = number
    })

    xhr_action_apdex_settings = object({
      frustrating_fallback_threshold = number
      frustrating_threshold          = number
      tolerated_fallback_threshold   = number
      tolerated_threshold            = number
    })

    waterfall_settings = object({
      resource_browser_caching_threshold            = number
      resources_threshold                           = number
      slow_cnd_resources_threshold                  = number
      slow_first_party_resources_threshold          = number
      slow_third_party_resources_threshold          = number
      speed_index_visually_complete_ratio_threshold = number
      uncompressed_resources_threshold              = number
    })

    monitoring_settings = object({
      add_cross_origin_anonymous_attribute = bool
      cache_control_header_optimizations   = bool
      injection_mode                       = string

      advanced_javascript_tag_settings = object({
        max_action_name_length = number
        max_errors_to_capture  = number

        additional_event_handlers = object({
          max_dom_nodes = number
        })

        global_event_capture_settings = object({
          click       = bool
          doubleclick = bool
          keydown     = bool
          keyup       = bool
          mousedown   = bool
          mouseup     = bool
          scroll      = bool
        })
      })

      content_capture = object({
        javascript_errors                  = bool
        visually_complete_and_speed_index = bool

        resource_timing_settings = object({
          instrumentation_delay    = number
          non_w3c_resource_timings = bool
          w3c_resource_timings     = bool
        })

        timeout_settings = object({
          temporary_action_limit         = number
          temporary_action_total_timeout = number
          timed_action_support           = bool
        })

        visually_complete_settings = object({
          inactivity_timeout = number
          mutation_timeout   = number
          threshold          = number
        })
      })
    })
  }))
  default = {}
}
