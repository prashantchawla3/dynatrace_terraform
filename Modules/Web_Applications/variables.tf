variable "app_detection_rules" {
  description = "List of application detection rules used to associate traffic with web applications."
  type = list(object({
    id             = string
    application_id = string
    matcher        = string
    pattern        = string
    description    = optional(string)
    insert_after   = optional(string)
  }))
  default = []
}

variable "custom_config_properties" {
  description = "List of custom configuration properties scoped by application ID for enrichment or control."
  type = list(object({
    application_id  = string
    custom_property = string
  }))
  default = []
}

variable "app_error_rules" {
  description = "List of error capturing rules per web application for custom and HTTP errors."
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
  default = []
}

variable "calculated_web_metrics" {
  description = "List of calculated metrics based on user actions and dimensions for web applications."
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
  default = []
}

variable "key_user_actions" {
  description = "List of key user actions used to flag critical interactions for performance tracking."
  type = list(object({
    application_id = string
    domain         = string
    name           = string
    type           = string
  }))
  default = []
}

variable "web_app_auto_injections" {
  description = "List of auto-injection settings per web application, including snippet format and header behavior."
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
  default = []
}


variable "web_app_beacon_endpoints" {
  description = "List of beacon endpoints used by Dynatrace agents to report data."
  type = list(object({
    application_id = string
    type           = string
    url            = string
    use_cors       = bool
  }))
  default = []
}

variable "web_app_beacon_origins" {
  description = "List of beacon origins used for cross-origin communication."
  type = list(object({
    matcher = string
    pattern = string
  }))
  default = []
}

variable "web_app_custom_errors" {
  description = "Custom error detection rules for scoped web applications."
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
    })
  }))
  default = []
}

variable "web_app_custom_injections" {
  description = "Custom HTML injection rules for web monitoring instrumentation."
  type = list(object({
    application_id = string
    enabled        = bool
    operator       = string
    url_pattern    = string
    rule           = string
    html_pattern   = string
    insert_after   = string
  }))
  default = []
}

variable "web_app_enablements" {
  description = "Enable flags and traffic control limits for RUM and session replay per application."
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
  default = []
}

variable "web_app_injection_cookies" {
  description = "Cookie attributes used by Dynatrace JavaScript injection."
  type = list(object({
    application_id              = string
    same_site_cookie_attribute  = string
    use_secure_cookie_attribute = bool
  }))
  default = []
}

variable "web_javascript_updates" {
  description = "JavaScript tag update configurations for active applications."
  type = list(object({
    application_id     = string
    javascript_version = string
  }))
  default = []
}

variable "web_javascript_versions" {
  description = "List of custom JavaScript version identifiers for injection."
  type = list(object({
    custom_javascript_version = string
  }))
  default = []
}

variable "web_app_key_performance_customs" {
  description = "Custom thresholds for generic key performance metrics."
  type = list(object({
    scope = string
    thresholds = optional(object({
      frustrating_threshold_seconds = number
      tolerated_threshold_seconds   = number
    }))
  }))
  default = []
}

variable "web_app_key_performance_loads" {
  description = "Performance metric thresholds for page loads with fallback logic."
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
  default = []
}

variable "web_app_key_performance_xhrs" {
  description = "Performance metric thresholds for XHR calls with fallback logic."
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
  default = []
}

variable "web_app_request_errors" {
  description = "Error rules for failed requests in web applications."
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
      })
      )
      filter_settings = optional(object({
        filter = string
        url    = string
      }))
    }))
  }))
  default = []
}

variable "web_app_resource_cleanups" {
  description = "Regex-based cleanup rules for web resource naming and grouping."
  type = list(object({
    name               = string
    regular_expression = string
    replace_with       = string
    insert_after       = string
  }))
  default = []
}

variable "web_resource_types" {
  description = "Web resource classification rules for detailed reporting."
  type = list(object({
    primary_resource_type   = string
    regular_expression      = string
    insert_after            = string
    secondary_resource_type = string
  }))
  default = []
}

variable "application_identifier" {
  description = "Unique Dynatrace entity ID for the application."
  type        = string
  default     = "APPLICATION-123456"
}

variable "filter_config" {
  description = "Optional filter configuration used for detection or targeting."
  type = object({
    application_match_target = string
    application_match_type   = string
    pattern                  = string
  })
  default = null
}

variable "name" {
  description = "Optional name used in rule or entity labeling."
  type        = string
  default     = null
}

variable "order" {
  description = "Optional ordering value for injection or detection logic."
  type        = string
  default     = null
}

variable "application_id" {
  description = "Logical application ID used across web app modules."
  type        = string
  default     = "web-frontend-africa"
}

variable "custom_event_properties_allow_list" {
  description = "Allow list of custom event fields (grouped by rule set)."
  type = list(list(object({
    field_data_type = string
    field_name      = string
  })))
  default = []
}

variable "custom_session_properties_allow_list" {
  description = "Allow list of custom session fields (grouped by rule set)."
  type = list(list(object({
    field_data_type = string
    field_name      = string
  })))
  default = []
}

variable "javascript_filename" {
  description = "Filename used for the deployed JavaScript tag."
  type        = string
  default     = "dt-agent.min.js"
}

variable "javascript_version" {
  description = "JavaScript version used for injection updates."
  type        = string
  default     = "1.300.0"
}

variable "custom_javascript_version" {
  description = "Custom JavaScript version identifier."
  type        = string
  default     = "custom-1.300.0-af"
}

variable "primary_resource_type" {
  description = "Primary resource type used in web resource classification."
  type        = string
  default     = "javascript"
}

variable "regular_expression" {
  description = "Regex used for matching resource types or injection paths."
  type        = string
  default     = ".*\\.js$"
}

variable "secondary_resource_type" {
  description = "Optional secondary type for resource classification."
  type        = string
  default     = null
}

variable "insert_after" {
  description = "Ordering key used to insert configuration after a defined marker."
  type        = string
  default     = null
}
