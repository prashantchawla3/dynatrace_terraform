app_detection_rules = [
  {
    id             = "rule1"
    application_id = "APPLICATION-0868C0CADA3AC0CA"
    matcher        = "DOMAIN_MATCHES"
    pattern        = "TerraformTest"
    description    = null
    insert_after   = null
  },
]

custom_config_properties = [
  {
    application_id  = "APPLICATION-0868C0CADA3AC0CA"
    custom_property = "examplekey=examplevalue"
  },
]

app_error_rules = [
  {
    web_application_id = "APPLICATION-0868C0CADA3AC0CA"
    custom_errors = {
      capture         = true
      custom_alerting = true
      impact_apdex    = false
      key_matcher     = "EQUALS"
      key_pattern     = "hashicorp"
      value_matcher   = ""
      value_pattern   = ""
    }
    http_errors = {
      capture                     = true
      consider_blocked_requests   = false
      consider_for_ai             = true
      consider_unknown_error_code = false
      error_codes                 = "404"
      filter                      = "CONTAINS"
      filter_by_url               = true
      impact_apdex                = true
      url                         = "/example/url"
    }
  },
]


calculated_web_metrics = [
  {
    app_identifier = "APPLICATION-0868C0CADA3AC0CA"
    enabled        = true
    metric_key     = "calc:apps.web.examplemetric"
    name           = "Example Metric"
    dimensions = {
      dimension    = "StringProperty"
      property_key = "web_utm_campaign"
      top_x        = 10
    }
    metric_definition = {
      metric       = "VisuallyComplete"
      property_key = null
    }
    user_action_filter = {
      continent                         = "GEOLOCATION-970B6D0A98F55995"
      target_view_group_name_match_type = "Equals"
      target_view_name_match_type       = "Equals"
    }
  },
]

key_user_actions = [
  {
    application_id = "APPLICATION-0868C0CADA3AC0CA"
    domain         = "example.com"
    name           = "Loading of page /custom"
    type           = "Load"
  },
]

web_app_auto_injections = [
  {
    application_id = "APPLICATION-0868C0CADA3AC0CA"
    cache_control_headers = {
      cache_control_headers = true
    }
    monitoring_code_source_section = {
      code_source          = "OneAgent"
      monitoring_code_path = "/testpath/"
    }
    snippet_format = {
      code_snippet_type = "DEFERRED"
      snippet_format    = "Code Snippet"
    }
  },
]

web_app_beacon_endpoints = [
  {
    application_id = "APPLICATION-0868C0CADA3AC0CA"
    type           = "ONEAGENT"
    url            = "/beacon"
    use_cors       = true
  },
]

web_app_beacon_origins = [
  {
    matcher = "CONTAINS"
    pattern = "Terraform-Origin"
  },
]

web_app_custom_errors = [
  {
    ignore_custom_errors_in_apdex_calculation = true
    scope                                     = "APPLICATION-0868C0CADA3AC0CA"
    error_rules = {
      key_matcher   = "EQUALS"
      key_pattern   = "hashicorp"
      value_matcher = "ALL"
      value_pattern = "examplevalue"
      capture_settings = {
        capture         = true
        consider_for_ai = true
        impact_apdex    = false
      }
    }
  },
]

web_app_custom_injections = [
  {
    application_id = "APPLICATION-0868C0CADA3AC0CA"
    enabled        = false
    operator       = "Starts"
    url_pattern    = "examplepattern"
    rule           = "AfterSpecificHtml"
    html_pattern   = "examplehtmlpattern"
    insert_after   = null
  },
]

web_app_enablements = [
  {
    application_id = "APPLICATION-0868C0CADA3AC0CA"
    rum = {
      enabled                  = true
      cost_and_traffic_control = 25
      enabled_on_grail         = false
    }
    session_replay = {
      enabled                  = false
      cost_and_traffic_control = 25
    }
  },
]

web_app_injection_cookies = [
  {
    application_id              = "APPLICATION-0868C0CADA3AC0CA"
    same_site_cookie_attribute  = "STRICT"
    use_secure_cookie_attribute = true
  },
]

web_javascript_updates = [
  {
    application_id     = "APPLICATION-0868C0CADA3AC0CA"
    javascript_version = "LATEST_STABLE"
  },
]

web_javascript_versions = [
  {
    custom_javascript_version = "10261230220152234"
  },
]

web_app_key_performance_customs = [
  {
    scope = "APPLICATION_METHOD-0868C0CADA3AC0CA"
    thresholds = {
      frustrating_threshold_seconds = 12
      tolerated_threshold_seconds   = 3
    }
  },
]

web_app_key_performance_loads = [
  {
    kpm   = "VISUALLY_COMPLETE"
    scope = "APPLICATION_METHOD-0868C0CADA3AC0CA"
    thresholds = {
      frustrating_threshold_seconds = 12
      tolerated_threshold_seconds   = 3
    }
    fallback_thresholds = {
      frustrating_fallback_threshold_seconds = 12
      tolerated_fallback_threshold_seconds   = 3
    }
  },
]

web_app_key_performance_xhrs = [
  {
    kpm   = "VISUALLY_COMPLETE"
    scope = "APPLICATION_METHOD-0868C0CADA3AC0CA"
    thresholds = {
      frustrating_threshold_seconds = 12
      tolerated_threshold_seconds   = 3
    }
    fallback_thresholds = {
      frustrating_fallback_threshold_seconds = 12
      tolerated_fallback_threshold_seconds   = 3
    }
  },
]

web_app_request_errors = [
  {
    ignore_request_errors_in_apdex_calculation = false
    scope                                      = "APPLICATION-0868C0CADA3AC0CA"
    error_rules = {
      consider_csp_violations = true
      consider_failed_images  = true
      error_codes             = "400"
      capture_settings = {
        capture         = false
        consider_for_ai = false
        impact_apdex    = false
      }
      filter_settings = {
        filter = "ENDS_WITH"
        url    = "hashicorp"
      }
    }
  },
]

web_app_resource_cleanups = [
  {
    name               = "Mask journeyId"
    regular_expression = "([a-z]+)TerraformExample"
    replace_with       = "$1"
    insert_after       = null
  },
]

web_resource_types = [
  {
    primary_resource_type   = "OTHER"
    regular_expression      = ".Terraform"
    insert_after            = null
    secondary_resource_type = null
  },
]


