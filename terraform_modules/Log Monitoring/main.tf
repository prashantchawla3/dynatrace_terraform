resource "dynatrace_log_agent_feature_flags" "example" {
  scope                    = var.log_agent_scope
  new_container_log_detector = var.new_container_log_detector
  journald_log_detector    = var.journald_log_detector
}

resource "dynatrace_log_buckets" "example" {
  enabled     = var.log_buckets_enabled
  bucket_name = var.log_buckets_bucket_name
  matcher     = var.log_buckets_matcher
  rule_name   = var.log_buckets_rule_name
  insert_after = var.log_buckets_insert_after
}

resource "dynatrace_log_custom_attribute" "example" {
  sidebar = var.log_custom_attribute_sidebar
  key     = var.log_custom_attribute_key
}

resource "dynatrace_log_custom_source" "example" {
  name    = var.log_custom_source_name
  enabled = var.log_custom_source_enabled
  scope   = var.log_custom_source_scope
  custom_log_source {
    type = var.log_custom_source_type
    values_and_enrichment {
      custom_log_source_with_enrichment {
        path = var.log_custom_source_path
        enrichment {
          enrichment {
            type  = var.log_custom_source_enrichment_type_1
            key   = var.log_custom_source_enrichment_key_1
            value = var.log_custom_source_enrichment_value_1
          }
          enrichment {
            type  = var.log_custom_source_enrichment_type_2
            key   = var.log_custom_source_enrichment_key_2
            value = var.log_custom_source_enrichment_value_2
          }
        }
      }
    }
  }
}

resource "dynatrace_log_debug_settings" "example" {
  enabled = var.log_debug_settings_enabled
}

resource "dynatrace_log_events" "example" {
  enabled = var.log_events_enabled
  query   = var.log_events_query
  summary = var.log_events_summary
  event_template {
    description = var.log_events_description
    event_type  = var.log_events_event_type
    title       = var.log_events_title
    metadata {
      item {
        metadata_key   = var.log_events_metadata_key_1
        metadata_value = var.log_events_metadata_value_1
      }
    }
  }
}

resource "dynatrace_log_metrics" "example" {
  enabled           = var.log_metrics_enabled
  dimensions        = var.log_metrics_dimensions
  key               = var.log_metrics_key
  measure           = var.log_metrics_measure
  measure_attribute = var.log_metrics_measure_attribute
  query             = var.log_metrics_query
}

resource "dynatrace_log_oneagent" "example" {
  container_timezone_heuristic_enabled = var.log_oneagent_container_timezone_heuristic_enabled
  containers_logs_detection_enabled    = var.log_oneagent_containers_logs_detection_enabled
  date_search_limit_bytes              = var.log_oneagent_date_search_limit_bytes
  default_timezone                     = var.log_oneagent_default_timezone
  event_log_query_timeout_sec          = var.log_oneagent_event_log_query_timeout_sec
  iisdetection_enabled                 = var.log_oneagent_iisdetection_enabled
  log_scanner_linux_nfs_enabled        = var.log_oneagent_log_scanner_linux_nfs_enabled
  max_lgis_per_entity_count            = var.log_oneagent_max_lgis_per_entity_count
  min_binary_detection_limit_bytes     = var.log_oneagent_min_binary_detection_limit_bytes
  monitor_own_logs_enabled             = var.log_oneagent_monitor_own_logs_enabled
  open_log_files_detection_enabled     = var.log_oneagent_open_log_files_detection_enabled
  scope                                = var.log_oneagent_scope
  severity_detection_limit_bytes       = var.log_oneagent_severity_detection_limit_bytes
  severity_detection_lines_limit       = var.log_oneagent_severity_detection_lines_limit
  system_logs_detection_enabled        = var.log_oneagent_system_logs_detection_enabled
}

resource "dynatrace_log_processing" "example" {
  enabled   = var.log_processing_enabled
  query     = var.log_processing_query
  rule_name = var.log_processing_rule_name
  processor_definition {
    rule = var.log_processing_rule
  }
  rule_testing {
    sample_log = var.log_processing_sample_log
  }
  insert_after = var.log_processing_insert_after
}

resource "dynatrace_log_security_context" "example" {
  security_context_rule {
    query             = var.log_security_context_query
    rule_name         = var.log_security_context_rule_name
    value_source      = var.log_security_context_value_source
    value_source_field = var.log_security_context_value_source_field
    value             = var.log_security_context_value
  }
  insert_after = var.log_security_context_insert_after
}

resource "dynatrace_log_sensitive_data_masking" "example" {
  name    = var.log_sensitive_data_masking_name
  enabled = var.log_sensitive_data_masking_enabled
  scope   = var.log_sensitive_data_masking_scope
  masking {
    type        = var.log_sensitive_data_masking_type
    expression  = var.log_sensitive_data_masking_expression
    replacement = var.log_sensitive_data_masking_replacement
  }
  matchers {
    matcher {
      attribute = var.log_sensitive_data_masking_attribute
      operator  = var.log_sensitive_data_masking_operator
      values    = var.log_sensitive_data_masking_values
    }
  }
  insert_after = var.log_sensitive_data_masking_insert_after
}

resource "dynatrace_log_storage" "example" {
  name            = var.log_storage_name
  enabled         = var.log_storage_enabled
  scope           = var.log_storage_scope
  send_to_storage = var.log_storage_send_to_storage
  matchers {
    matcher {
      attribute = var.log_storage_attribute
      operator  = var.log_storage_operator
      values    = var.log_storage_values
    }
  }
  insert_after = var.log_storage_insert_after
}

resource "dynatrace_log_timestamp" "example" {
  enabled           = var.log_timestamp_enabled
  config_item_title = var.log_timestamp_config_item_title
  date_time_pattern = var.log_timestamp_date_time_pattern
  scope             = var.log_timestamp_scope
  timezone          = var.log_timestamp_timezone
  matchers {
    matcher {
      attribute = var.log_timestamp_attribute
      operator  = var.log_timestamp_operator
      values    = var.log_timestamp_values
    }
  }
  insert_after = var.log_timestamp_insert_after
}