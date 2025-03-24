log_agent_scope              = "HOST-1234567890000000"
new_container_log_detector   = true
journald_log_detector        = false

log_buckets_enabled     = true
log_buckets_bucket_name = "default_logs"
log_buckets_matcher     = "matchesPhrase(content, \"error\")"
log_buckets_rule_name   = "example_rule"
log_buckets_insert_after = null

log_custom_attribute_sidebar = false
log_custom_attribute_key     = "example_key"

log_custom_source_name                = "example_custom_source"
log_custom_source_enabled             = false
log_custom_source_scope               = "HOST_GROUP-1234567890000000"
log_custom_source_type                = "WINDOWS_EVENT_LOG"
log_custom_source_path                = "/terraform"
log_custom_source_enrichment_type_1   = "attribute"
log_custom_source_enrichment_key_1    = "key1"
log_custom_source_enrichment_value_1  = "value1"
log_custom_source_enrichment_type_2   = "attribute"
log_custom_source_enrichment_key_2    = "key2"
log_custom_source_enrichment_value_2  = "value2"

log_debug_settings_enabled = false

log_events_enabled          = false
log_events_query            = "matchesPhrase(content, \"terratest\")"
log_events_summary          = "Created by Terraform"
log_events_description      = "Created by Terraform"
log_events_event_type       = "INFO"
log_events_title            = "{content}"
log_events_metadata_key_1   = "terraform.key"
log_events_metadata_value_1 = "terraform.value"

log_metrics_enabled           = true
log_metrics_dimensions        = ["dt.os.type", "dt.entity.process_group"]
log_metrics_key               = "log.terraformexample3"
log_metrics_measure           = "ATTRIBUTE"
log_metrics_measure_attribute = "dt.entity.host"
log_metrics_query             = "matchesPhrase(content, \"terratest\")"

log_oneagent_container_timezone_heuristic_enabled = true
log_oneagent_containers_logs_detection_enabled    = true
log_oneagent_date_search_limit_bytes              = 64
log_oneagent_default_timezone                     = "Local time zone"
log_oneagent_event_log_query_timeout_sec          = 5
log_oneagent_iisdetection_enabled                 = true
log_oneagent_log_scanner_linux_nfs_enabled        = false
log_oneagent_max_lgis_per_entity_count            = 200
log_oneagent_min_binary_detection_limit_bytes     = 512
log_oneagent_monitor_own_logs_enabled             = false
log_oneagent_open_log_files_detection_enabled     = true
log_oneagent_scope                                = "environment"
log_oneagent_severity_detection_limit_bytes       = 100
log_oneagent_severity_detection_lines_limit       = 2
log_oneagent_system_logs_detection_enabled        = true

log_processing_enabled     = false
log_processing_query       = "matchesPhrase(content, \"terratest\")"
log_processing_rule_name   = "example_rule"
log_processing_rule        = <<-EOT
  PARSE(content,"LD 'total: ' INT:total '; failed: ' INT:failed")
  | FIELDS_ADD(failed.percentage: 100.0 * failed / total + '%')
  | FIELDS_REMOVE(total, failed)
EOT
log_processing_sample_log  = "{\"content\": \"\"}"
log_processing_insert_after = null

log_security_context_query             = "matchesPhrase(content, \"example\")"
log_security_context_rule_name         = "example_rule"
log_security_context_value_source      = "FIELD"
log_security_context_value_source_field = "example_field"
log_security_context_value             = null
log_security_context_insert_after      = null

log_sensitive_data_masking_name        = "example_sensitive_data_masking"
log_sensitive_data_masking_enabled     = true
log_sensitive_data_masking_scope       = "environment"
log_sensitive_data_masking_type        = "SHA1"
log_sensitive_data_masking_expression  = "FOO"
log_sensitive_data_masking_replacement = null
log_sensitive_data_masking_attribute   = "container.name"
log_sensitive_data_masking_operator    = "MATCHES"
log_sensitive_data_masking_values      = ["jlkjk"]
log_sensitive_data_masking_insert_after = null

log_storage_name            = "example_log_storage"
log_storage_enabled         = false
log_storage_scope           = "HOST_GROUP-1234567890000000"
log_storage_send_to_storage = false
log_storage_attribute       = "container.name"
log_storage_operator        = "MATCHES"
log_storage_values          = ["TerraformTest"]
log_storage_insert_after    = null

log_timestamp_enabled           = false
log_timestamp_config_item_title = "example_log_timestamp"
log_timestamp_date_time_pattern = "%m/%d/%Y %I:%M:%S %p"
log_timestamp_scope             = "environment"
log_timestamp_timezone          = "America/Detroit"
log_timestamp_attribute         = "container.name"
log_timestamp_operator          = "MATCHES"
log_timestamp_values            = ["terraform"]
log_timestamp_insert_after      = null