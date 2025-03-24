variable "scope" {
  description = "The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP)."
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

variable "enabled_buckets" {
  description = "This setting is enabled (true) or disabled (false) for log buckets."
  type        = bool
}

variable "bucket_name" {
  description = "A 'bucket' is the length of time your logs will be stored."
  type        = string
}

variable "matcher_buckets" {
  description = "Matcher (DQL) for log buckets."
  type        = string
}

variable "rule_name_buckets" {
  description = "Rule name for log buckets."
  type        = string
}

variable "insert_after_buckets" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order for log buckets."
  type        = string
  default     = null
}

variable "sidebar_custom_attribute" {
  description = "Show attribute values in side bar for custom attribute."
  type        = bool
}

variable "key_custom_attribute" {
  description = "The attribute key is case sensitive in log data ingestion for custom attribute."
  type        = string
}

variable "name_custom_source" {
  description = "Name of the custom log source."
  type        = string
}

variable "enabled_custom_source" {
  description = "This setting is enabled (true) or disabled (false) for custom log source."
  type        = bool
}

variable "scope_custom_source" {
  description = "The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP) for custom log source."
  type        = string
}

variable "custom_log_source_type" {
  description = "Type of the custom log source (LOG_PATH_PATTERN, WINDOWS_EVENT_LOG)."
  type        = string
}

variable "custom_log_source_path" {
  description = "Path for the custom log source."
  type        = string
}

variable "enrichment_type_custom_source" {
  description = "Type of the enrichment (attribute) for custom log source."
  type        = string
}

variable "enrichment_key1_custom_source" {
  description = "Key for the first enrichment attribute for custom log source."
  type        = string
}

variable "enrichment_value1_custom_source" {
  description = "Value for the first enrichment attribute for custom log source."
  type        = string
}

variable "enrichment_key2_custom_source" {
  description = "Key for the second enrichment attribute for custom log source."
  type        = string
}

variable "enrichment_value2_custom_source" {
  description = "Value for the second enrichment attribute for custom log source."
  type        = string
}

variable "enabled_debug_settings" {
  description = "This setting is enabled (true) or disabled (false) for debug settings."
  type        = bool
}

variable "enabled_events" {
  description = "This setting is enabled (true) or disabled (false) for log events."
  type        = bool
}

variable "query_events" {
  description = "Log query for log events."
  type        = string
}

variable "summary_events" {
  description = "The textual summary of the log event entry."
  type        = string
}

variable "event_description" {
  description = "The description of the event to trigger."
  type        = string
}

variable "event_type" {
  description = "The type of the event to trigger."
  type        = string
}

variable "event_title" {
  description = "The title of the event to trigger."
  type        = string
}

variable "metadata_key" {
  description = "Key for the metadata item."
  type        = string
}

variable "metadata_value" {
  description = "Value for the metadata item."
  type        = string
}

variable "enabled_metrics" {
  description = "This setting is enabled (true) or disabled (false) for log metrics."
  type        = bool
}

variable "dimensions_metrics" {
  description = "To enable splitting on your metric, add desired dimensions."
  type        = list(string)
}

variable "key_metrics" {
  description = "Metric key for log metrics."
  type        = string
}

variable "measure_metrics" {
  description = "Measure type (OCCURRENCE, ATTRIBUTE) for log metrics."
  type        = string
}

variable "measure_attribute_metrics" {
  description = "Attribute for the measure for log metrics."
  type        = string
}

variable "query_metrics" {
  description = "Matcher query for log metrics."
  type        = string
}

variable "container_timezone_heuristic_enabled" {
  description = "Enables automatic detection of timezone in container's logs if it is not explicitly defined in content or configured."
  type        = bool
}

variable "containers_logs_detection_enabled" {
  description = "Allows detection of log messages written to the containerized application's stdout/stderr streams."
  type        = bool
}

variable "date_search_limit_bytes" {
  description = "Defines the number of characters in every log line (starting from the first character in the line) where the timestamp is searched."
  type        = number
}

variable "default_timezone" {
  description = "Default timezone for agent if more specific configurations is not defined."
  type        = string
}

variable "event_log_query_timeout_sec" {
  description = "Defines the maximum timeout value, in seconds, for the query extracting Windows Event Logs."
  type        = number
}

variable "iisdetection_enabled" {
  description = "Allows detection of logs and event logs written by IIS server."
  type        = bool
}

variable "log_scanner_linux_nfs_enabled" {
  description = "Allows detection of logs written to mounted network storage drives. Applies only to Linux hosts."
  type        = bool
}

variable "max_lgis_per_entity_count" {
  description = "Defines the maximum number of log group instances per entity after which, the new automatic ones wouldn't be added."
  type        = number
}

variable "min_binary_detection_limit_bytes" {
  description = "Defines the minimum number of bytes in log file required for binary detection."
  type        = number
}

variable "monitor_own_logs_enabled" {
  description = "Enabling this option may affect your licensing costs."
  type        = bool
}

variable "open_log_files_detection_enabled" {
  description = "Automatically detect logs written by important processes."
  type        = bool
}

variable "scope_oneagent" {
  description = "The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP) for OneAgent."
  type        = string
}

variable "severity_detection_limit_bytes" {
  description = "Defines the number of characters in every log line (starting from the first character in the line) where severity is searched."
  type        = number
}

variable "severity_detection_lines_limit" {
  description = "Defines the number of the first lines of every log entry where severity is searched."
  type        = number
}

variable "system_logs_detection_enabled" {
  description = "Linux: syslog, message log Windows: system, application, security event logs."
  type        = bool
}

variable "enabled_processing" {
  description = "This setting is enabled (true) or disabled (false) for log processing."
  type        = bool
}

variable "query_processing" {
  description = "Matcher query for log processing."
  type        = string
}

variable "rule_name_processing" {
  description = "Rule name for log processing."
  type        = string
}

variable "processor_rule" {
  description = "Processor definition rule."
  type        = string
}

variable "sample_log_processing" {
  description = "Sample log in JSON format for log processing."
  type        = string
}

variable "insert_after_processing" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order for log processing."
  type        = string
  default     = null
}

variable "query_security_context" {
  description = "Matcher query for log security context."
  type        = string
}

variable "rule_name_security_context" {
  description = "Rule name for log security context."
  type        = string
}

variable "value_source_security_context" {
  description = "Possible values: FIELD, LITERAL for log security context."
  type        = string
}

variable "value_source_field_security_context" {
  description = "Name of field used to copy value for log security context."
  type        = string
}

variable "value_security_context" {
  description = "Literal value to be set for log security context."
  type        = string
  default     = null
}

variable "insert_after_security_context" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order for log security context."
  type        = string
  default     = null
}

variable "name_sensitive_data_masking" {
  description = "Name of the sensitive data masking rule."
  type        = string
}

variable "enabled_sensitive_data_masking" {
  description = "This setting is enabled (true) or disabled (false) for sensitive data masking."
  type        = bool
}

variable "scope_sensitive_data_masking" {
  description = "The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP) for sensitive data masking."
  type        = string
}

variable "masking_type_sensitive_data_masking" {
  description = "Type of masking (SHA1, STRING) for sensitive data masking."
  type        = string
}

variable "expression_sensitive_data_masking" {
  description = "Expression to be masked for sensitive data masking."
  type        = string
}

variable "replacement_sensitive_data_masking" {
  description = "The string to replace the masked expression with. Irrelevant if type is SHA1 for sensitive data masking."
  type        = string
  default     = null
}

variable "matcher_attribute_sensitive_data_masking" {
  description = "Attribute for the matcher for sensitive data masking."
  type        = string
}

variable "matcher_operator_sensitive_data_masking" {
  description = "Operator for the matcher (MATCHES) for sensitive data masking."
  type        = string
}

variable "matcher_values_sensitive_data_masking" {
  description = "Values for the matcher for sensitive data masking."
  type        = list(string)
}

variable "insert_after_sensitive_data_masking" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order for sensitive data masking."
  type        = string
  default     = null
}

variable "name_storage" {
  description = "Name of the log storage rule."
  type        = string
}

variable "enabled_storage" {
  description = "This setting is enabled (true) or disabled (false) for log storage."
  type        = bool
}

variable "scope_storage" {
  description = "The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP) for log storage."
  type        = string
}

variable "send_to_storage" {
  description = "If true, matching logs will be included in storage. If false, matching logs will be excluded from storage."
  type        = bool
}

variable "matcher_attribute_storage" {
  description = "Attribute for the matcher for log storage."
  type        = string
}

variable "matcher_operator_storage" {
  description = "Operator for the matcher (MATCHES) for log storage."
  type        = string
}

variable "matcher_values_storage" {
  description = "Values for the matcher for log storage."
  type        = list(string)
}

variable "insert_after_storage" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order for log storage."
  type        = string
  default     = null
}

variable "enabled_timestamp" {
  description = "This setting is enabled (true) or disabled (false) for log timestamp."
  type        = bool
}

variable "config_item_title_timestamp" {
  description = "Name of the log timestamp configuration item."
  type        = string
}

variable "date_time_pattern_timestamp" {
  description = "Date-time pattern for log timestamp."
  type        = string
}

variable "scope_timestamp" {
  description = "The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP) for log timestamp."
  type        = string
}

variable "timezone_timestamp" {
  description = "Timezone for log timestamp."
  type        = string
}

variable "matcher_attribute_timestamp" {
  description = "Attribute for the matcher for log timestamp."
  type        = string
}

variable "matcher_operator_timestamp" {
  description = "Operator for the matcher (MATCHES) for log timestamp."
  type        = string
}

variable "matcher_values_timestamp" {
  description = "Values for the matcher for log timestamp."
  type        = list(string)
}

variable "insert_after_timestamp" {
  description = "Specify the ID of the resource instance that comes before this instance regarding order for log timestamp."
  type        = string
  default     = null
}

