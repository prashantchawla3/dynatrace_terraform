resource "dynatrace_log_agent_feature_flags" "example" {
  scope                      = var.scope
  new_container_log_detector = var.new_container_log_detector
  journald_log_detector      = var.journald_log_detector
}

resource "dynatrace_log_buckets" "example" {
  enabled     = var.enabled_buckets
  bucket_name = var.bucket_name
  matcher     = var.matcher_buckets
  rule_name   = var.rule_name_buckets
  insert_after = var.insert_after_buckets
}

resource "dynatrace_log_custom_attribute" "example" {
  sidebar = var.sidebar_custom_attribute
  key     = var.key_custom_attribute
}

resource "dynatrace_log_custom_source" "example" {
  name    = var.name_custom_source
  enabled = var.enabled_custom_source
  scope   = var.scope_custom_source
  custom_log_source {
    type = var.custom_log_source_type
    values_and_enrichment {
      custom_log_source_with_enrichment {
        path = var.custom_log_source_path
        enrichment {
          enrichment {
            type  = var.enrichment_type_custom_source
            key   = var.enrichment_key1_custom_source
            value = var.enrichment_value1_custom_source
          }
          enrichment {
            type  = var.enrichment_type_custom_source
            key   = var.enrichment_key2_custom_source
            value = var.enrichment_value2_custom_source
          }
        }
      }
    }
  }
}

resource "dynatrace_log_debug_settings" "example" {
  enabled = var.enabled_debug_settings
}

resource "dynatrace_log_events" "example" {
  enabled = var.enabled_events
  query   = var.query_events
  summary = var.summary_events
  event_template {
    description = var.event_description
    event_type  = var.event_type
    title       = var.event_title
    metadata {
      item {
        metadata_key   = var.metadata_key
        metadata_value = var.metadata_value
      }
    }
  }
}

resource "dynatrace_log_metrics" "example" {
  enabled           = var.enabled_metrics
  dimensions        = var.dimensions_metrics
  key               = var.key_metrics
  measure           = var.measure_metrics
  measure_attribute = var.measure_attribute_metrics
  query             = var.query_metrics
}

resource "dynatrace_log_oneagent" "example" {
  container_timezone_heuristic_enabled = var.container_timezone_heuristic_enabled
  containers_logs_detection_enabled    = var.containers_logs_detection_enabled
  date_search_limit_bytes              = var.date_search_limit_bytes
  default_timezone                     = var.default_timezone
  event_log_query_timeout_sec          = var.event_log_query_timeout_sec
  iisdetection_enabled                 = var.iisdetection_enabled
  log_scanner_linux_nfs_enabled        = var.log_scanner_linux_nfs_enabled
  max_lgis_per_entity_count            = var.max_lgis_per_entity_count
  min_binary_detection_limit_bytes     = var.min_binary_detection_limit_bytes
  monitor_own_logs_enabled             = var.monitor_own_logs_enabled
  open_log_files_detection_enabled     = var.open_log_files_detection_enabled
  scope                                = var.scope_oneagent
  severity_detection_limit_bytes       = var.severity_detection_limit_bytes
  severity_detection_lines_limit       = var.severity_detection_lines_limit
  system_logs_detection_enabled        = var.system_logs_detection_enabled
}

resource "dynatrace_log_processing" "example" {
  enabled   = var.enabled_processing
  query     = var.query_processing
  rule_name = var.rule_name_processing
  processor_definition {
    rule = var.processor_rule
  }
  rule_testing {
    sample_log = var.sample_log_processing
  }
  insert_after = var.insert_after_processing
}

resource "dynatrace_log_security_context" "example" {
  security_context_rule {
    query             = var.query_security_context
    rule_name         = var.rule_name_security_context
    value_source      = var.value_source_security_context
    value_source_field = var.value_source_field_security_context
    value             = var.value_security_context
  }
  insert_after = var.insert_after_security_context
}

resource "dynatrace_log_sensitive_data_masking" "example" {
  name    = var.name_sensitive_data_masking
  enabled = var.enabled_sensitive_data_masking
  scope   = var.scope_sensitive_data_masking
  masking {
    type        = var.masking_type_sensitive_data_masking
    expression  = var.expression_sensitive_data_masking
    replacement = var.replacement_sensitive_data_masking
  }
  matchers {
    matcher {
      attribute = var.matcher_attribute_sensitive_data_masking
      operator  = var.matcher_operator_sensitive_data_masking
      values    = var.matcher_values_sensitive_data_masking
    }
  }
  insert_after = var.insert_after_sensitive_data_masking
}

resource "dynatrace_log_storage" "example" {
  name            = var.name_storage
  enabled         = var.enabled_storage
  scope           = var.scope_storage
  send_to_storage = var.send_to_storage
  matchers {
    matcher {
      attribute = var.matcher_attribute_storage
      operator  = var.matcher_operator_storage
      values    = var.matcher_values_storage
    }
  }
  insert_after = var.insert_after_storage
}

resource "dynatrace_log_timestamp" "example" {
  enabled           = var.enabled_timestamp
  config_item_title = var.config_item_title_timestamp
  date_time_pattern = var.date_time_pattern_timestamp
  scope             = var.scope_timestamp
  timezone          = var.timezone_timestamp
  matchers {
    matcher {
      attribute = var.matcher_attribute_timestamp
      operator  = var.matcher_operator_timestamp
      values    = var.matcher_values_timestamp
    }
  }
  insert_after = var.insert_after_timestamp
}
