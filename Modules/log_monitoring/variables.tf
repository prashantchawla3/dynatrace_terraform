variable "log_agent_feature_flags" {
  description = "Log agent feature flag configuration per scope"
  type = map(object({
    scope                      = string
    new_container_log_detector = bool
  }))
  default = {}
}

variable "log_buckets" {
  description = "Dynatrace log bucket definitions"
  type = map(object({
    enabled     = bool
    bucket_name = string
    matcher     = string
    rule_name   = string
  }))
  default = {}
}

variable "log_custom_attribute" {
  description = "Custom attributes added to log sidebar"
  type = map(object({
    sidebar = bool
    key     = string
  }))
  default = {}
}

variable "log_custom_source" {
  description = "Custom log source definitions with enrichment logic"
  type = map(object({
    name    = string
    enabled = bool
    scope   = string
    custom_log_source = object({
      type = string
      values_and_enrichment = list(object({
        custom_log_source_with_enrichment = object({
          path = string
          enrichment = list(object({
            type  = string
            key   = string
            value = string
          }))
        })
      }))
    })
  }))
  default = {}
}

variable "log_debug_settings" {
  description = "Enable or disable global debug logging settings"
  type = map(object({
    enabled = bool
  }))
  default = {}
}

variable "log_events" {
  description = "Event definitions extracted from logs"
  type = map(object({
    enabled = bool
    query   = string
    summary = string
    event_template = object({
      description = string
      event_type  = string
      title       = string
      metadata = object({
        items = list(object({
          metadata_key   = string
          metadata_value = string
        }))
      })
    })
  }))
  default = {}
}

variable "log_metrics" {
  description = "Log-based metric extraction configuration"
  type = map(object({
    enabled           = bool
    dimensions        = list(string)
    key               = string
    measure           = string
    measure_attribute = string
    query             = string
  }))
  default = {}
}

variable "log_oneagent" {
  description = "Advanced OneAgent log settings and thresholds"
  type = map(object({
    container_timezone_heuristic_enabled = bool
    containers_logs_detection_enabled    = bool
    date_search_limit_bytes              = number
    default_timezone                     = string
    event_log_query_timeout_sec          = number
    iisdetection_enabled                 = bool
    log_scanner_linux_nfs_enabled        = bool
    max_lgis_per_entity_count            = number
    min_binary_detection_limit_bytes     = number
    monitor_own_logs_enabled             = bool
    open_log_files_detection_enabled     = bool
    scope                                = string
    severity_detection_limit_bytes       = number
    severity_detection_lines_limit       = number
    system_logs_detection_enabled        = bool
  }))
  default = {}
}

variable "log_processing" {
  description = "Log processing rules and parser definitions"
  type = map(object({
    enabled   = bool
    query     = string
    rule_name = string
    processor_definition = object({
      rule = string
    })
    rule_testing = object({
      sample_log = string
    })
  }))
  default = {}
}

variable "log_security_context" {
  description = "Security context detection rules from logs"
  type = map(object({
    security_context_rule = object({
      query              = string
      rule_name          = string
      value_source_field = string
      value_source       = string
    })
  }))
  default = {}
}

variable "log_sensitive_data_masking" {
  description = "Rules for masking sensitive data in logs"
  type = map(object({
    name    = string
    enabled = bool
    scope   = string
    masking = list(object({
      type       = string
      expression = string
    }))
    matchers = list(object({
      matcher = list(object({
        attribute = string
        operator  = string
        values    = list(string)
      }))
    }))
  }))
  default = {}
}

variable "log_storage" {
  description = "Configuration for log storage routing and filtering"
  type = map(object({
    name            = string
    enabled         = bool
    scope           = string
    send_to_storage = bool
    matchers = list(object({
      matcher = list(object({
        attribute = string
        operator  = string
        values    = list(string)
      }))
    }))
  }))
  default = {}
}

variable "log_timestamp" {
  description = "Timestamp extraction rules from log patterns"
  type = map(object({
    enabled           = bool
    config_item_title = string
    date_time_pattern = string
    scope             = string
    timezone          = string
    matchers = list(object({
      matcher = list(object({
        attribute = string
        operator  = string
        values    = list(string)
      }))
    }))
  }))
  default = {}
}
