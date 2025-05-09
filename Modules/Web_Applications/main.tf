
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

