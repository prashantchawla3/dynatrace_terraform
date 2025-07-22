calculated_mobile_metrics = {
  metric1 = {
    enabled        = true
    app_identifier = "MOBILE_APPLICATION-7F6AE72450E14F11"
    metric_key     = "calc:apps.mobile.metric1"
    metric_type    = "USER_ACTION_DURATION"
    dimensions = [
      { dimension = "APP_VERSION", top_x = 10 }
    ]
  }
}

custom_app_enablements = {
  custom1 = {
    scope = "environment"
    rum = {
      enabled = false
      cost_and_traffic_control = 40
    }
  }
}

mobile_app_enablements = {
  mobile1 = {
    rum = {
      enabled = true
      cost_and_traffic_control = 25
    }
    session_replay = {
      on_crash = false
    }
  }
}

mobile_app_key_performance = {
  perf1 = {
    frustrating_if_reported_or_web_request_error = true
    scope = "DEVICE_APPLICATION_METHOD-1234567890000000"
    thresholds = {
      frustrating_threshold_seconds = 12
      tolerable_threshold_seconds   = 3
    }
  }
}

mobile_app_request_errors = {
  errors1 = {
    scope = "MOBILE_APPLICATION-1234567890000000"
    error_rules = [
      { error_codes = "409" },
      { error_codes = "410" }
    ]
  }
}

mobile_applications = {
  SIXTH_ASDFGHIJK = {
    beacon_endpoint_type    = "INSTRUMENTED_WEB_SERVER"
    beacon_endpoint_url     = "http://some.server.com/dtmb"
    user_session_percentage = 100
    apdex = {
      frustrated          = 12000
      frustrated_on_error = true
      tolerable           = 3000
    }
    properties = {
      api_values = [
        {
          key = "apivaluea", name = "valueA", type = "STRING", aggregation = "LAST",
          display_name = "valueA", store_as_session_property = true, store_as_user_action_property = true
        },
        {
          key = "apivalueb", name = "valueB", type = "STRING", aggregation = "LAST",
          display_name = "valueA", store_as_user_action_property = true
        },
        {
          key = "apivaluec", name = "valueC", type = "STRING", aggregation = "LAST",
          display_name = "valueC", store_as_user_action_property = true
        }
      ]
      request_attributes = [
        {
          type = "STRING", aggregation = "FIRST", display_name = "string",
          id = "7950a7ad-c735-4efc-b896-159a3f645516", key = "str2",
          store_as_session_property = true
        },
        {
          type = "STRING", aggregation = "FIRST", display_name = "string",
          id = "7950a7ad-c735-4efc-b896-159a3f645516", key = "string",
          store_as_session_property = true, store_as_user_action_property = true
        }
      ]
    }
  }
}
