variable "app_detection_rules" {
  description = "List of application detection rules"
  type = list(object({
    id             = string
    application_id = string
    matcher        = string
    pattern        = string
    description    = optional(string)
    insert_after   = optional(string)
  }))
}

variable "custom_config_properties" {
  description = "List of custom configuration properties"
  type = list(object({
    application_id  = string
    custom_property = string
  }))
}

variable "app_error_rules" {
  description = "List of application error rules"
  type = list(object({
    web_application_id = string
    custom_errors = optional(object({
      capture         = bool
      custom_alerting = bool
      impact_apdex    = bool
      key_matcher     = string
      key_pattern     = string
      value_matcher   = string
      value_pattern   = string
    }))
    http_errors = optional(object({
      capture                     = bool
      consider_blocked_requests   = bool
      consider_for_ai             = bool
      consider_unknown_error_code = bool
      error_codes                 = string
      filter                      = string
      filter_by_url               = bool
      impact_apdex                = bool
      url                         = string
    }))
  }))
}

variable "calculated_web_metrics" {
  description = "List of calculated web metrics"
  type = list(object({
    app_identifier = string
    enabled        = bool
    metric_key     = string
    name           = string
    dimensions = optional(object({
      dimension    = string
      property_key = string
      top_x        = number
    }))
    metric_definition = optional(object({
      metric       = string
      property_key = string
    }))
    user_action_filter = optional(object({
      continent                         = string
      target_view_group_name_match_type = string
      target_view_name_match_type       = string
    }))
  }))
}

variable "key_user_actions" {
  description = "List of key user actions"
  type = list(object({
    application_id = string
    domain         = string
    name           = string
    type           = string
  }))
}

variable "web_app_auto_injections" {
  description = "List of web app auto injections"
  type = list(object({
    application_id = string
    cache_control_headers = optional(object({
      cache_control_headers = bool
    }))
    monitoring_code_source_section = optional(object({
      code_source          = string
      monitoring_code_path = string
    }))
    snippet_format = optional(object({
      code_snippet_type = string
      snippet_format    = string
    }))
  }))
}

variable "web_app_beacon_endpoints" {
  description = "List of web app beacon endpoints"
  type = list(object({
    application_id = string
    type           = string
    url            = string
    use_cors       = bool
  }))
}

variable "web_app_beacon_origins" {
  description = "List of web app beacon origins"
  type = list(object({
    matcher = string
    pattern = string
  }))
}

variable "web_app_custom_errors" {
  description = "List of web app custom errors"
  type = list(object({
    ignore_custom_errors_in_apdex_calculation = bool
    scope                                     = string
    error_rules = optional(object({
      key_matcher   = string
      key_pattern   = string
      value_matcher = string
      value_pattern = string
      capture_settings = optional(object({
        capture         = bool
        consider_for_ai = bool
        impact_apdex    = bool
      }))
    }))
  }))
}

variable "web_app_custom_injections" {
  description = "List of web app custom injections"
  type = list(object({
    application_id = string
    enabled        = bool
    operator       = string
    url_pattern    = string
    rule           = string
    html_pattern   = string
    insert_after   = string
  }))
}

variable "web_app_enablements" {
  description = "List of web app enablements"
  type = list(object({
    application_id = string
    rum = optional(object({
      enabled                  = bool
      cost_and_traffic_control = number
      enabled_on_grail         = bool
    }))
    session_replay = optional(object({
      enabled                  = bool
      cost_and_traffic_control = number
    }))
  }))
}

variable "web_app_injection_cookies" {
  description = "List of web app injection cookies"
  type = list(object({
    application_id              = string
    same_site_cookie_attribute  = string
    use_secure_cookie_attribute = bool
  }))
}

variable "web_javascript_updates" {
  description = "List of web javascript updates"
  type = list(object({
    application_id     = string
    javascript_version = string
  }))
}

variable "web_javascript_versions" {
  description = "List of web javascript versions"
  type = list(object({
    custom_javascript_version = string
  }))
}

variable "web_app_key_performance_customs" {
  description = "List of web app key performance customs"
  type = list(object({
    scope = string
    thresholds = optional(object({
      frustrating_threshold_seconds = number
      tolerated_threshold_seconds   = number
    }))
  }))
}

variable "web_app_key_performance_loads" {
  description = "List of web app key performance loads"
  type = list(object({
    kpm   = string
    scope = string
    thresholds = optional(object({
      frustrating_threshold_seconds = number
      tolerated_threshold_seconds   = number
    }))
    fallback_thresholds = optional(object({
      frustrating_fallback_threshold_seconds = number
      tolerated_fallback_threshold_seconds   = number
    }))
  }))
}

variable "web_app_key_performance_xhrs" {
  description = "List of web app key performance xhrs"
  type = list(object({
    kpm   = string
    scope = string
    thresholds = optional(object({
      frustrating_threshold_seconds = number
      tolerated_threshold_seconds   = number
    }))
    fallback_thresholds = optional(object({
      frustrating_fallback_threshold_seconds = number
      tolerated_fallback_threshold_seconds   = number
    }))
  }))
}

variable "web_app_request_errors" {
  description = "List of web app request errors"
  type = list(object({
    ignore_request_errors_in_apdex_calculation = bool
    scope                                      = string
    error_rules = optional(object({
      consider_csp_violations = bool
      consider_failed_images  = bool
      error_codes             = string
      capture_settings = optional(object({
        capture         = bool
        consider_for_ai = bool
        impact_apdex    = bool
      }))
      filter_settings = optional(object({
        filter = string
        url    = string
      }))
    }))
  }))
}

variable "web_app_resource_cleanups" {
  description = "List of web app resource cleanups"
  type = list(object({
    name               = string
    regular_expression = string
    replace_with       = string
    insert_after       = string
  }))
}

variable "web_resource_types" {
  description = "List of web resource types"
  type = list(object({
    primary_resource_type   = string
    regular_expression      = string
    insert_after            = string
    secondary_resource_type = string
  }))
}

