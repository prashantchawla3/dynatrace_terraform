variable "calculated_mobile_metrics" {
  description = "Map of calculated mobile metrics, including app ID, key, type, and dimension ranking."
  type = map(object({
    enabled        = bool
    app_identifier = string
    metric_key     = string
    metric_type    = string
    dimensions     = list(object({
      dimension = string
      top_x     = number
    }))
  }))
  default = {
    app1 = {
      enabled        = true
      app_identifier = "MOBILE-APP-001"
      metric_key     = "crashRate"
      metric_type    = "CUSTOM"
      dimensions     = [
        { dimension = "region", top_x = 5 },
        { dimension = "os",     top_x = 3 }
      ]
    }
  }
}

variable "custom_app_enablements" {
  description = "Enable RUM for custom apps, including scope and cost control settings."
  type = map(object({
    scope = string
    rum = object({
      enabled                  = bool
      cost_and_traffic_control = number
    })
  }))
  default = {
    custom1 = {
      scope = "CUSTOM:APP"
      rum = {
        enabled                  = true
        cost_and_traffic_control = 1000
      }
    }
  }
}

variable "mobile_app_enablements" {
  description = "RUM and session replay enablement settings for mobile apps."
  type = map(object({
    rum = object({
      enabled                  = bool
      cost_and_traffic_control = number
    })
    session_replay = object({
      on_crash = bool
    })
  }))
  default = {
    mobile1 = {
      rum = {
        enabled                  = true
        cost_and_traffic_control = 500
      }
      session_replay = {
        on_crash = true
      }
    }
  }
}

variable "mobile_app_key_performance" {
  description = "Performance thresholds and scope configuration for mobile apps."
  type = map(object({
    frustrating_if_reported_or_web_request_error = bool
    scope                                        = string
    thresholds = object({
      frustrating_threshold_seconds = number
      tolerable_threshold_seconds   = number
    })
  }))
  default = {
    perf1 = {
      frustrating_if_reported_or_web_request_error = true
      scope = "APP:MOBILE"
      thresholds = {
        frustrating_threshold_seconds = 8
        tolerable_threshold_seconds   = 4
      }
    }
  }
}

variable "mobile_app_request_errors" {
  description = "Configuration of error code rules per mobile app scope."
  type = map(object({
    scope       = string
    error_rules = list(object({
      error_codes = string
    }))
  }))
  default = {
    app_error = {
      scope = "MOBILE:APP"
      error_rules = [
        { error_codes = "404,500" },
        { error_codes = "401" }
      ]
    }
  }
}

variable "mobile_applications" {
  description = "Full configuration block for mobile application instrumentation."
  type = map(object({
    beacon_endpoint_type    = string
    beacon_endpoint_url     = string
    user_session_percentage = number
    apdex = object({
      frustrated          = number
      frustrated_on_error = bool
      tolerable           = number
    })
    properties = object({
      api_values = list(object({
        key                           = string
        name                          = string
        type                          = string
        aggregation                   = string
        display_name                  = string
        store_as_session_property     = optional(bool)
        store_as_user_action_property = optional(bool)
      }))
      request_attributes = list(object({
        type                          = string
        aggregation                   = string
        display_name                  = string
        id                            = string
        key                           = string
        store_as_session_property     = optional(bool)
        store_as_user_action_property = optional(bool)
      }))
    })
  }))
  default = {
    mobile_app = {
      beacon_endpoint_type    = "CLUSTER"
      beacon_endpoint_url     = "https://dynatrace.example.com/beacon"
      user_session_percentage = 100
      apdex = {
        frustrated          = 12000
        frustrated_on_error = true
        tolerable           = 3000
      }
      properties = {
        api_values = [
          {
            key                           = "region"
            name                          = "Region"
            type                          = "STRING"
            aggregation                   = "COUNT"
            display_name                  = "User Region"
            store_as_session_property     = true
            store_as_user_action_property = false
          }
        ]
        request_attributes = [
          {
            type                          = "STRING"
            aggregation                   = "SUM"
            display_name                  = "API Version"
            id                            = "api_version_id"
            key                           = "api_version"
            store_as_session_property     = true
            store_as_user_action_property = true
          }
        ]
      }
    }
  }
}
