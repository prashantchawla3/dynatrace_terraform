variable "log_agent_scope" {
  description = "The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP). Omit this property if you want to cover the whole environment."
  type        = string
}

variable "new_container_log_detector" {
  description = "Enable OneAgent to collect all container logs in Kubernetes environments."
  type        = bool
}

variable "journald_log_detector" {
  description = "Enable OneAgent to collect logs from Journald on Linux systems."
  type        = bool
  default     = false
}

variable "log_buckets_enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
  default     = true
}

variable "log_buckets_bucket_name" {
  description = "A 'bucket' is the length of time your logs will be stored. Select the bucket that's best for you."
  type        = string
}

variable "log_buckets_matcher" {
  description = "Matcher (DQL)"
  type        = string
}

variable "log_buckets_rule_name" {
  description = "Rule name"
  type        = string
}

variable "log_buckets_insert_after" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order."
  type        = string
  default     = null
}

variable "log_custom_attribute_sidebar" {
  description = "Show attribute values in side bar"
  type        = bool
  default     = false
}

variable "log_custom_attribute_key" {
  description = "The attribute key is case sensitive in log data ingestion."
  type        = string
}

variable "log_custom_source_name" {
  description = "Name"
  type        = string
}

variable "log_custom_source_enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
  default     = false
}

variable "log_custom_source_scope" {
  description = "The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP). Omit this property if you want to cover the whole environment."
  type        = string
}

variable "log_custom_source_type" {
  description = "Possible Values: LOG_PATH_PATTERN, WINDOWS_EVENT_LOG"
  type        = string
}

variable "log_custom_source_path" {
  description = "Values"
  type        = string
}

variable "log_custom_source_enrichment_type_1" {
  description = "Possible Values: Attribute"
  type        = string
}

variable "log_custom_source_enrichment_key_1" {
  description = "Enrichment key 1"
  type        = string
}

variable "log_custom_source_enrichment_value_1" {
  description = "Enrichment value 1"
  type        = string
}

variable "log_custom_source_enrichment_type_2" {
  description = "Possible Values: Attribute"
  type        = string
}

variable "log_custom_source_enrichment_key_2" {
  description = "Enrichment key 2"
  type        = string
}

variable "log_custom_source_enrichment_value_2" {
  description = "Enrichment value 2"
  type        = string
}

variable "log_debug_settings_enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
  default     = false
}

variable "log_events_enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
  default     = false
}

variable "log_events_query" {
  description = "Log query"
  type        = string
}

variable "log_events_summary" {
  description = "The textual summary of the log event entry"
  type        = string
}

variable "log_events_description" {
  description = "The description of the event to trigger."
  type        = string
}

variable "log_events_event_type" {
  description = "Possible Values: AVAILABILITY, CUSTOM_ALERT, CUSTOM_ANNOTATION, CUSTOM_CONFIGURATION, CUSTOM_DEPLOYMENT, ERROR, INFO, MARKED_FOR_TERMINATION, RESOURCE, SLOWDOWN"
  type        = string
}

variable "log_events_title" {
  description = "The title of the event to trigger."
  type        = string
}

variable "log_events_metadata_key_1" {
  description = "Metadata key 1"
  type        = string
}

variable "log_events_metadata_value_1" {
  description = "Metadata value 1"
  type        = string
}

variable "log_metrics_enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
  default     = true
}

variable "log_metrics_dimensions" {
  description = "Dimensions"
  type        = list(string)
}

variable "log_metrics_key" {
  description = "Key"
  type        = string
}

variable "log_metrics_measure" {
  description = "Measure"
  type        = string
}

variable "log_metrics_measure_attribute" {
  description = "Measure attribute"
  type        = string
}

variable "log_metrics_query" {
  description = "Query"
  type        = string
}

variable "log_oneagent_container_timezone_heuristic_enabled" {
  description = "Enable OneAgent to use container timezone heuristic."
  type        = bool
  default     = true
}

variable "log_oneagent_containers_logs_detection_enabled" {
  description = "Enable OneAgent to detect container logs."
  type        = bool
  default     = true
}

variable "log_oneagent_date_search_limit_bytes" {
  description = "Date search limit in bytes."
  type        = number
  default     = 1024
}

variable "log_oneagent_default_timezone" {
  description = "Default timezone for OneAgent."
  type        = string
  default     = "UTC"
}

variable "log_oneagent_event_log_query_timeout_sec" {
  description = "Event log query timeout in seconds."
  type        = number
  default     = 30
}

variable "log_oneagent_iisdetection_enabled" {
  description = "Enable IIS detection."
  type        = bool
  default     = true
}

variable "log_oneagent_log_scanner_linux_nfs_enabled" {
  description = "Enable log scanner for Linux NFS."
  type        = bool
  default     = true
}

variable "log_oneagent_max_lgis_per_entity_count" {
  description = "Max LGIs per entity count."
  type        = number
  default     = 100
}

variable "log_oneagent_min_binary_detection_limit_bytes" {
  description = "Min binary detection limit in bytes."
  type        = number
  default     = 512
}

variable "log_oneagent_monitor_own_logs_enabled" {
  description = "Enable monitoring of OneAgent's own logs."
  type        = bool
  default     = true
}

variable "log_oneagent_open_log_files_detection_enabled" {
  description = "Enable detection of open log files."
  type        = bool
  default     = true
}

variable "log_oneagent_scope" {
  description = "Scope for OneAgent settings."
  type        = string
}

variable "log_oneagent_severity_detection_limit_bytes" {
  description = "Severity detection limit in bytes."
  type        = number
  default     = 2048
}

variable "log_oneagent_severity_detection_lines_limit" {
  description = "Severity detection lines limit."
  type        = number
  default     = 100
}

variable "log_oneagent_system_logs_detection_enabled" {
  description = "Enable system logs detection."
  type        = bool
  default     = true
}

variable "log_processing_enabled" {
  description = "Enable log processing."
  type        = bool
  default     = true
}

variable "log_processing_query" {
  description = "Log processing query."
  type        = string
}

variable "log_processing_rule_name" {
  description = "Log processing rule name."
  type        = string
}

variable "log_processing_rule" {
  description = "Log processing rule."
  type        = string
}

variable "log_processing_sample_log" {
  description = "Sample log for rule testing."
  type        = string
}

variable "log_processing_insert_after" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order."
  type        = string
  default     = null
}

variable "log_security_context_query" {
  description = "Log security context query."
  type        = string
}

variable "log_security_context_rule_name" {
  description = "Log security context rule name."
  type        = string
}

variable "log_security_context_value_source" {
  description = "Log security context value source."
  type        = string
}

variable "log_security_context_value_source_field" {
  description = "Log security context value source field."
  type        = string
}

variable "log_security_context_value" {
  description = "Log security context value."
  type        = string
}

variable "log_security_context_insert_after" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order."
  type        = string
  default     = null
}

variable "log_sensitive_data_masking_name" {
  description = "Name of the sensitive data masking rule."
  type        = string
}

variable "log_sensitive_data_masking_enabled" {
  description = "Enable sensitive data masking."
  type        = bool
  default     = true
}

variable "log_sensitive_data_masking_scope" {
  description = "Scope for sensitive data masking."
  type        = string
}

variable "log_sensitive_data_masking_type" {
  description = "Type of sensitive data masking."
  type        = string
}

variable "log_sensitive_data_masking_expression" {
  description = "Expression for sensitive data masking."
  type        = string
}

variable "log_sensitive_data_masking_replacement" {
  description = "Replacement text for sensitive data."
  type        = string
}

variable "log_sensitive_data_masking_attribute" {
  description = "Attribute for sensitive data masking."
  type        = string
}

variable "log_sensitive_data_masking_operator" {
  description = "Operator for sensitive data masking."
  type        = string
}

variable "log_sensitive_data_masking_values" {
  description = "Values for sensitive data masking."
  type        = list(string)
}

variable "log_sensitive_data_masking_insert_after" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order."
  type        = string
  default     = null
}

variable "log_storage_name" {
  description = "Name of the log storage."
  type        = string
}

variable "log_storage_enabled" {
  description = "Enable log storage."
  type        = bool
  default     = true
}

variable "log_storage_scope" {
  description = "Scope for log storage."
  type        = string
}

variable "log_storage_send_to_storage" {
  description = "Send logs to storage."
  type        = bool
  default     = true
}

variable "log_storage_attribute" {
  description = "Attribute for log storage."
  type        = string
}

variable "log_storage_operator" {
  description = "Operator for log storage."
  type        = string
}

variable "log_storage_values" {
  description = "Values for log storage."
  type        = list(string)
}

variable "log_storage_insert_after" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order."
  type        = string
  default     = null
}

variable "log_timestamp_enabled" {
  description = "Enable log timestamp."
  type        = bool
  default     = true
}

variable "log_timestamp_config_item_title" {
  description = "Title of the log timestamp configuration item."
  type        = string
}

variable "log_timestamp_date_time_pattern" {
  description = "Date-time pattern for log timestamp."
  type        = string
}

variable "log_timestamp_scope" {
  description = "Scope for log timestamp."
  type        = string
}

variable "log_timestamp_timezone" {
  description = "Timezone for log timestamp."
  type        = string
}

variable "log_timestamp_attribute" {
  description = "Attribute for log timestamp."
  type        = string
}

variable "log_timestamp_operator" {
  description = "Operator for log timestamp."
  type        = string
}

variable "log_timestamp_values" {
  description = "Values for log timestamp."
  type        = list(string)
}

variable "log_timestamp_insert_after" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order."
  type        = string
  default     = null
}