resource "dynatrace_web_application" "this" {
  for_each = var.web_applications

  name                                 = each.value.name
  type                                 = each.value.type
  cost_control_user_session_percentage = each.value.cost_control_user_session_percentage
  load_action_key_performance_metric   = each.value.load_action_key_performance_metric
  real_user_monitoring_enabled         = each.value.real_user_monitoring_enabled
  xhr_action_key_performance_metric    = each.value.xhr_action_key_performance_metric

  custom_action_apdex_settings {
    frustrating_fallback_threshold = each.value.custom_action_apdex_settings.frustrating_fallback_threshold
    frustrating_threshold          = each.value.custom_action_apdex_settings.frustrating_threshold
    tolerated_fallback_threshold   = each.value.custom_action_apdex_settings.tolerated_fallback_threshold
    tolerated_threshold            = each.value.custom_action_apdex_settings.tolerated_threshold
  }

  load_action_apdex_settings {
    frustrating_fallback_threshold = each.value.load_action_apdex_settings.frustrating_fallback_threshold
    frustrating_threshold          = each.value.load_action_apdex_settings.frustrating_threshold
    tolerated_fallback_threshold   = each.value.load_action_apdex_settings.tolerated_fallback_threshold
    tolerated_threshold            = each.value.load_action_apdex_settings.tolerated_threshold
  }

  xhr_action_apdex_settings {
    frustrating_fallback_threshold = each.value.xhr_action_apdex_settings.frustrating_fallback_threshold
    frustrating_threshold          = each.value.xhr_action_apdex_settings.frustrating_threshold
    tolerated_fallback_threshold   = each.value.xhr_action_apdex_settings.tolerated_fallback_threshold
    tolerated_threshold            = each.value.xhr_action_apdex_settings.tolerated_threshold
  }

  waterfall_settings {
    resource_browser_caching_threshold            = each.value.waterfall_settings.resource_browser_caching_threshold
    resources_threshold                           = each.value.waterfall_settings.resources_threshold
    slow_cnd_resources_threshold                  = each.value.waterfall_settings.slow_cnd_resources_threshold
    slow_first_party_resources_threshold          = each.value.waterfall_settings.slow_first_party_resources_threshold
    slow_third_party_resources_threshold          = each.value.waterfall_settings.slow_third_party_resources_threshold
    speed_index_visually_complete_ratio_threshold = each.value.waterfall_settings.speed_index_visually_complete_ratio_threshold
    uncompressed_resources_threshold              = each.value.waterfall_settings.uncompressed_resources_threshold
  }

  monitoring_settings {
    add_cross_origin_anonymous_attribute = each.value.monitoring_settings.add_cross_origin_anonymous_attribute
    cache_control_header_optimizations   = each.value.monitoring_settings.cache_control_header_optimizations
    injection_mode                       = each.value.monitoring_settings.injection_mode

    advanced_javascript_tag_settings {
      max_action_name_length = each.value.monitoring_settings.advanced_javascript_tag_settings.max_action_name_length
      max_errors_to_capture  = each.value.monitoring_settings.advanced_javascript_tag_settings.max_errors_to_capture

      additional_event_handlers {
        max_dom_nodes = each.value.monitoring_settings.advanced_javascript_tag_settings.additional_event_handlers.max_dom_nodes
      }

      global_event_capture_settings {
        click       = each.value.monitoring_settings.advanced_javascript_tag_settings.global_event_capture_settings.click
        doubleclick = each.value.monitoring_settings.advanced_javascript_tag_settings.global_event_capture_settings.doubleclick
        keydown     = each.value.monitoring_settings.advanced_javascript_tag_settings.global_event_capture_settings.keydown
        keyup       = each.value.monitoring_settings.advanced_javascript_tag_settings.global_event_capture_settings.keyup
        mousedown   = each.value.monitoring_settings.advanced_javascript_tag_settings.global_event_capture_settings.mousedown
        mouseup     = each.value.monitoring_settings.advanced_javascript_tag_settings.global_event_capture_settings.mouseup
        scroll      = each.value.monitoring_settings.advanced_javascript_tag_settings.global_event_capture_settings.scroll
      }
    }

    content_capture {
      javascript_errors                  = each.value.monitoring_settings.content_capture.javascript_errors
      visually_complete_and_speed_index = each.value.monitoring_settings.content_capture.visually_complete_and_speed_index

      resource_timing_settings {
        instrumentation_delay    = each.value.monitoring_settings.content_capture.resource_timing_settings.instrumentation_delay
        non_w3c_resource_timings = each.value.monitoring_settings.content_capture.resource_timing_settings.non_w3c_resource_timings
        w3c_resource_timings     = each.value.monitoring_settings.content_capture.resource_timing_settings.w3c_resource_timings
      }

      timeout_settings {
        temporary_action_limit         = each.value.monitoring_settings.content_capture.timeout_settings.temporary_action_limit
        temporary_action_total_timeout = each.value.monitoring_settings.content_capture.timeout_settings.temporary_action_total_timeout
        timed_action_support           = each.value.monitoring_settings.content_capture.timeout_settings.timed_action_support
      }

      visually_complete_settings {
        inactivity_timeout = each.value.monitoring_settings.content_capture.visually_complete_settings.inactivity_timeout
        mutation_timeout   = each.value.monitoring_settings.content_capture.visually_complete_settings.mutation_timeout
        threshold          = each.value.monitoring_settings.content_capture.visually_complete_settings.threshold
      }
    }
  }
}
