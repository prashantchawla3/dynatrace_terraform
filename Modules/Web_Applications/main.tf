
resource "dynatrace_application_detection_rule_v2" "app_detection_rule" {
  for_each       = { for rule in var.app_detection_rules : rule.id => rule }
  application_id = each.value.application_id
  matcher        = each.value.matcher
  pattern        = each.value.pattern
}

resource "dynatrace_web_app_custom_config_properties" "custom_config_properties" {
  count           = length(var.custom_config_properties)
  application_id  = var.custom_config_properties[count.index].application_id
  custom_property = var.custom_config_properties[count.index].custom_property
}

resource "dynatrace_application_error_rules" "app_error_rules" {
  count              = length(var.app_error_rules)
  web_application_id = var.app_error_rules[count.index].web_application_id

  dynamic "custom_errors" {
    for_each = var.app_error_rules[count.index].custom_errors != null ? [var.app_error_rules[count.index].custom_errors] : []
    content {
      rule {
        capture         = custom_errors.value.capture
        custom_alerting = custom_errors.value.custom_alerting
        impact_apdex    = custom_errors.value.impact_apdex
        key_matcher     = custom_errors.value.key_matcher
        key_pattern     = custom_errors.value.key_pattern
        value_matcher   = custom_errors.value.value_matcher
        value_pattern   = custom_errors.value.value_pattern
      }
    }
  }

  dynamic "http_errors" {
    for_each = var.app_error_rules[count.index].http_errors != null ? [var.app_error_rules[count.index].http_errors] : []
    content {
      rule {
        capture                     = http_errors.value.capture
        consider_blocked_requests   = http_errors.value.consider_blocked_requests
        consider_for_ai             = http_errors.value.consider_for_ai
        consider_unknown_error_code = http_errors.value.consider_unknown_error_code
        error_codes                 = http_errors.value.error_codes
        filter                      = http_errors.value.filter
        filter_by_url               = http_errors.value.filter_by_url
        impact_apdex                = http_errors.value.impact_apdex
        url                         = http_errors.value.url
      }
    }
  }
}

resource "dynatrace_calculated_web_metric" "calculated_web_metric" {
  count          = length(var.calculated_web_metrics)
  app_identifier = var.calculated_web_metrics[count.index].app_identifier
  enabled        = var.calculated_web_metrics[count.index].enabled
  metric_key     = var.calculated_web_metrics[count.index].metric_key
  name           = var.calculated_web_metrics[count.index].name

  dynamic "dimensions" {
    for_each = var.calculated_web_metrics[count.index].dimensions != null ? [var.calculated_web_metrics[count.index].dimensions] : []
    content {
      dimension {
        dimension    = dimensions.value.dimension
        property_key = dimensions.value.property_key
        top_x        = dimensions.value.top_x
      }
    }
  }

  dynamic "metric_definition" {
    for_each = var.calculated_web_metrics[count.index].metric_definition != null ? [var.calculated_web_metrics[count.index].metric_definition] : []
    content {
      metric       = metric_definition.value.metric
      property_key = metric_definition.value.property_key
    }
  }

  dynamic "user_action_filter" {
    for_each = var.calculated_web_metrics[count.index].user_action_filter != null ? [var.calculated_web_metrics[count.index].user_action_filter] : []
    content {
      continent                         = user_action_filter.value.continent
      target_view_group_name_match_type = user_action_filter.value.target_view_group_name_match_type
      target_view_name_match_type       = user_action_filter.value.target_view_name_match_type
    }
  }
}

resource "dynatrace_key_user_action" "key_user_action" {
  count          = length(var.key_user_actions)
  application_id = var.key_user_actions[count.index].application_id
  domain         = var.key_user_actions[count.index].domain
  name           = var.key_user_actions[count.index].name
  type           = var.key_user_actions[count.index].type
}

resource "dynatrace_web_app_auto_injection" "web_app_auto_injection" {
  count          = length(var.web_app_auto_injections)
  application_id = var.web_app_auto_injections[count.index].application_id

  dynamic "cache_control_headers" {
    for_each = var.web_app_auto_injections[count.index].cache_control_headers != null ? [var.web_app_auto_injections[count.index].cache_control_headers] : []
    content {
      cache_control_headers = cache_control_headers.value.cache_control_headers
    }
  }

  dynamic "monitoring_code_source_section" {
    for_each = var.web_app_auto_injections[count.index].monitoring_code_source_section != null ? [var.web_app_auto_injections[count.index].monitoring_code_source_section] : []
    content {
      code_source          = monitoring_code_source_section.value.code_source
      monitoring_code_path = monitoring_code_source_section.value.monitoring_code_path
    }
  }

  dynamic "snippet_format" {
    for_each = var.web_app_auto_injections[count.index].snippet_format != null ? [var.web_app_auto_injections[count.index].snippet_format] : []
    content {
      code_snippet_type = snippet_format.value.code_snippet_type
      snippet_format    = snippet_format.value.snippet_format
    }
  }
}

resource "dynatrace_web_app_beacon_endpoint" "web_app_beacon_endpoint" {
  count          = length(var.web_app_beacon_endpoints)
  application_id = var.web_app_beacon_endpoints[count.index].application_id
  type           = var.web_app_beacon_endpoints[count.index].type
  url            = var.web_app_beacon_endpoints[count.index].url
  use_cors       = var.web_app_beacon_endpoints[count.index].use_cors
}

resource "dynatrace_web_app_beacon_origins" "web_app_beacon_origins" {
  count   = length(var.web_app_beacon_origins)
  matcher = var.web_app_beacon_origins[count.index].matcher
  pattern = var.web_app_beacon_origins[count.index].pattern
}

resource "dynatrace_web_app_custom_errors" "web_app_custom_errors" {
  count                                     = length(var.web_app_custom_errors)
  ignore_custom_errors_in_apdex_calculation = var.web_app_custom_errors[count.index].ignore_custom_errors_in_apdex_calculation
  scope                                     = var.web_app_custom_errors[count.index].scope

  dynamic "error_rules" {
    for_each = var.web_app_custom_errors[count.index].error_rules != null ? [var.web_app_custom_errors[count.index].error_rules] : []
    content {
      error_rule {
        key_matcher   = error_rules.value.key_matcher
        key_pattern   = error_rules.value.key_pattern
        value_matcher = error_rules.value.value_matcher
        value_pattern = error_rules.value.value_pattern

        dynamic "capture_settings" {
          for_each = error_rules.value.capture_settings != null ? [error_rules.value.capture_settings] : []
          content {
            capture         = capture_settings.value.capture
            consider_for_ai = capture_settings.value.consider_for_ai
            impact_apdex    = capture_settings.value.impact_apdex
          }
        }
      }
    }
  }
}

resource "dynatrace_web_app_custom_injection" "web_app_custom_injection" {
  count          = length(var.web_app_custom_injections)
  application_id = var.web_app_custom_injections[count.index].application_id
  enabled        = var.web_app_custom_injections[count.index].enabled
  operator       = var.web_app_custom_injections[count.index].operator
  url_pattern    = var.web_app_custom_injections[count.index].url_pattern
  rule           = var.web_app_custom_injections[count.index].rule
  html_pattern   = var.web_app_custom_injections[count.index].html_pattern
  insert_after   = var.web_app_custom_injections[count.index].insert_after
}

resource "dynatrace_web_app_enablement" "web_app_enablement" {
  count          = length(var.web_app_enablements)
  application_id = var.web_app_enablements[count.index].application_id

  dynamic "rum" {
    for_each = var.web_app_enablements[count.index].rum != null ? [var.web_app_enablements[count.index].rum] : []
    content {
      enabled                  = rum.value.enabled
      cost_and_traffic_control = rum.value.cost_and_traffic_control
      enabled_on_grail         = rum.value.enabled_on_grail
    }
  }

  dynamic "session_replay" {
    for_each = var.web_app_enablements[count.index].session_replay != null ? [var.web_app_enablements[count.index].session_replay] : []
    content {
      enabled                  = session_replay.value.enabled
      cost_and_traffic_control = session_replay.value.cost_and_traffic_control
    }
  }
}

resource "dynatrace_web_app_injection_cookie" "web_app_injection_cookie" {
  count                       = length(var.web_app_injection_cookies)
  application_id              = var.web_app_injection_cookies[count.index].application_id
  same_site_cookie_attribute  = var.web_app_injection_cookies[count.index].same_site_cookie_attribute
  use_secure_cookie_attribute = var.web_app_injection_cookies[count.index].use_secure_cookie_attribute
}

resource "dynatrace_web_app_key_performance_custom" "web_app_key_performance_custom" {
  count = length(var.web_app_key_performance_customs)
  scope = var.web_app_key_performance_customs[count.index].scope

  dynamic "thresholds" {
    for_each = var.web_app_key_performance_customs[count.index].thresholds != null ? [var.web_app_key_performance_customs[count.index].thresholds] : []
    content {
      frustrating_threshold_seconds = thresholds.value.frustrating_threshold_seconds
      tolerated_threshold_seconds   = thresholds.value.tolerated_threshold_seconds
    }
  }
}

resource "dynatrace_web_app_key_performance_load" "web_app_key_performance_load" {
  count = length(var.web_app_key_performance_loads)
  kpm   = var.web_app_key_performance_loads[count.index].kpm
  scope = var.web_app_key_performance_loads[count.index].scope

  dynamic "thresholds" {
    for_each = var.web_app_key_performance_loads[count.index].thresholds != null ? [var.web_app_key_performance_loads[count.index].thresholds] : []
    content {
      frustrating_threshold_seconds = thresholds.value.frustrating_threshold_seconds
      tolerated_threshold_seconds   = thresholds.value.tolerated_threshold_seconds
    }
  }

  dynamic "fallback_thresholds" {
    for_each = var.web_app_key_performance_loads[count.index].fallback_thresholds != null ? [var.web_app_key_performance_loads[count.index].fallback_thresholds] : []
    content {
      frustrating_fallback_threshold_seconds = fallback_thresholds.value.frustrating_fallback_threshold_seconds
      tolerated_fallback_threshold_seconds   = fallback_thresholds.value.tolerated_fallback_threshold_seconds
    }
  }
}

resource "dynatrace_web_app_key_performance_xhr" "web_app_key_performance_xhr" {
  count = length(var.web_app_key_performance_xhrs)
  kpm   = var.web_app_key_performance_xhrs[count.index].kpm
  scope = var.web_app_key_performance_xhrs[count.index].scope

  dynamic "thresholds" {
    for_each = var.web_app_key_performance_xhrs[count.index].thresholds != null ? [var.web_app_key_performance_xhrs[count.index].thresholds] : []
    content {
      frustrating_threshold_seconds = thresholds.value.frustrating_threshold_seconds
      tolerated_threshold_seconds   = thresholds.value.tolerated_threshold_seconds
    }
  }

  dynamic "fallback_thresholds" {
    for_each = var.web_app_key_performance_xhrs[count.index].fallback_thresholds != null ? [var.web_app_key_performance_xhrs[count.index].fallback_thresholds] : []
    content {
      frustrating_fallback_threshold_seconds = fallback_thresholds.value.frustrating_fallback_threshold_seconds
      tolerated_fallback_threshold_seconds   = fallback_thresholds.value.tolerated_fallback_threshold_seconds
    }
  }
}

resource "dynatrace_web_app_request_errors" "web_app_request_errors" {
  count                                      = length(var.web_app_request_errors)
  ignore_request_errors_in_apdex_calculation = var.web_app_request_errors[count.index].ignore_request_errors_in_apdex_calculation
  scope                                      = var.web_app_request_errors[count.index].scope

  dynamic "error_rules" {
    for_each = var.web_app_request_errors[count.index].error_rules != null ? [var.web_app_request_errors[count.index].error_rules] : []
    content {
      error_rule {
        consider_csp_violations = error_rules.value.consider_csp_violations
        consider_failed_images  = error_rules.value.consider_failed_images
        error_codes             = error_rules.value.error_codes

        dynamic "capture_settings" {
          for_each = error_rules.value.capture_settings != null ? [error_rules.value.capture_settings] : []
          content {
            capture         = capture_settings.value.capture
            consider_for_ai = capture_settings.value.consider_for_ai
            impact_apdex    = capture_settings.value.impact_apdex
          }
        }

        dynamic "filter_settings" {
          for_each = error_rules.value.filter_settings != null ? [error_rules.value.filter_settings] : []
          content {
            filter = filter_settings.value.filter
            url    = filter_settings.value.url
          }
        }
      }
    }
  }
}

resource "dynatrace_web_app_resource_cleanup" "web_app_resource_cleanup" {
  count              = length(var.web_app_resource_cleanups)
  name               = var.web_app_resource_cleanups[count.index].name
  regular_expression = var.web_app_resource_cleanups[count.index].regular_expression
  replace_with       = var.web_app_resource_cleanups[count.index].replace_with
  insert_after       = var.web_app_resource_cleanups[count.index].insert_after
}

resource "dynatrace_application_detection_rule" "this" {
  application_identifier = var.application_identifier

  dynamic "filter_config" {
    for_each = var.filter_config != null ? [var.filter_config] : []
    content {
      application_match_target = filter_config.value.application_match_target
      application_match_type   = filter_config.value.application_match_type
      pattern                  = filter_config.value.pattern
    }
  }

  name  = var.name
  order = var.order
}

resource "dynatrace_web_app_custom_prop_restrictions" "this" {
  application_id = var.application_id

  dynamic "custom_event_properties_allow_list" {
    for_each = var.custom_event_properties_allow_list
    content {
      dynamic "custom_session_properties_allow" {
        for_each = custom_event_properties_allow_list.value
        content {
          field_data_type = custom_session_properties_allow.value.field_data_type
          field_name      = custom_session_properties_allow.value.field_name
        }
      }
    }
  }

  dynamic "custom_session_properties_allow_list" {
    for_each = var.custom_session_properties_allow_list
    content {
      dynamic "custom_session_properties_allow" {
        for_each = custom_session_properties_allow_list.value
        content {
          field_data_type = custom_session_properties_allow.value.field_data_type
          field_name      = custom_session_properties_allow.value.field_name
        }
      }
    }
  }
}

resource "dynatrace_web_app_javascript_filename" "this" {
  filename = var.javascript_filename
}

resource "dynatrace_web_app_javascript_updates" "this" {
  application_id     = var.application_id
  javascript_version = var.javascript_version
}

resource "dynatrace_web_app_javascript_version" "this" {
  custom_javascript_version = var.custom_javascript_version
}

resource "dynatrace_web_app_resource_types" "this" {
  primary_resource_type = var.primary_resource_type
  regular_expression    = var.regular_expression
  secondary_resource_type = var.secondary_resource_type
  insert_after            = var.insert_after
}

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
