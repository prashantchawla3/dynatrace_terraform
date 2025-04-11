variable "zone_name" {
  description = "Name of the management zone"
  type        = string
}

variable "zone_description" {
  description = "Description of the management zone"
  type        = string
}

variable "zone_legacy_id" {
  description = "Legacy ID of the management zone"
  type        = string
}

variable "entity_selector" {
  description = "Entity selector for the management zone"
  type        = string
}

variable "alerting_name" {
  description = "Name of the alerting profile"
  type        = string
}

variable "alerting_rule_1_tags" {
  description = "Tags for alerting rule 1"
  type        = list(string)
}

variable "alerting_rule_1_delay_in_minutes" {
  description = "Delay in minutes for alerting rule 1"
  type        = number
}

variable "alerting_rule_1_severity_level" {
  description = "Severity level for alerting rule 1"
  type        = string
}

variable "alerting_rule_2_tags" {
  description = "Tags for alerting rule 2"
  type        = list(string)
}

variable "alerting_rule_2_delay_in_minutes" {
  description = "Delay in minutes for alerting rule 2"
  type        = number
}

variable "alerting_rule_2_severity_level" {
  description = "Severity level for alerting rule 2"
  type        = string
}

variable "alerting_rule_3_tags" {
  description = "Tags for alerting rule 3"
  type        = list(string)
}

variable "alerting_rule_3_delay_in_minutes" {
  description = "Delay in minutes for alerting rule 3"
  type        = number
}

variable "alerting_rule_3_severity_level" {
  description = "Severity level for alerting rule 3"
  type        = string
}

variable "alerting_rule_4_tags" {
  description = "Tags for alerting rule 4"
  type        = list(string)
}

variable "alerting_rule_4_delay_in_minutes" {
  description = "Delay in minutes for alerting rule 4"
  type        = number
}

variable "alerting_rule_4_severity_level" {
  description = "Severity level for alerting rule 4"
  type        = string
}

variable "alerting_rule_5_tags" {
  description = "Tags for alerting rule 5"
  type        = list(string)
}

variable "alerting_rule_5_delay_in_minutes" {
  description = "Delay in minutes for alerting rule 5"
  type        = number
}

variable "alerting_rule_5_severity_level" {
  description = "Severity level for alerting rule 5"
  type        = string
}

variable "alerting_rule_6_tags" {
  description = "Tags for alerting rule 6"
  type        = list(string)
}

variable "alerting_rule_6_delay_in_minutes" {
  description = "Delay in minutes for alerting rule 6"
  type        = number
}

variable "alerting_rule_6_severity_level" {
  description = "Severity level for alerting rule 6"
  type        = string
}

variable "connectivity_alerts" {
  description = "Enable or disable connectivity alerts"
  type        = bool
}

variable "process_group_id" {
  description = "ID of the process group"
  type        = string
}

variable "maintenance_name" {
  description = "Name of the maintenance window"
  type        = string
}

variable "maintenance_description" {
  description = "Description of the maintenance window"
  type        = string
}

variable "maintenance_type" {
  description = "Type of the maintenance window"
  type        = string
}

variable "maintenance_disable_synthetic" {
  description = "Disable synthetic monitoring during maintenance"
  type        = bool
}

variable "maintenance_suppression" {
  description = "Enable or disable alert suppression during maintenance"
  type        = bool
}

variable "maintenance_schedule_type" {
  description = "Type of the maintenance schedule"
  type        = string
}

variable "maintenance_weekly_day_of_week" {
  description = "Day of the week for weekly maintenance"
  type        = string
}

variable "maintenance_weekly_end_date" {
  description = "End date for weekly maintenance"
  type        = string
}

variable "maintenance_weekly_start_date" {
  description = "Start date for weekly maintenance"
  type        = string
}

variable "maintenance_weekly_end_time" {
  description = "End time for weekly maintenance"
  type        = string
}

variable "maintenance_weekly_start_time" {
  description = "Start time for weekly maintenance"
  type        = string
}

variable "maintenance_weekly_time_zone" {
  description = "Time zone for weekly maintenance"
  type        = string
}

variable "maintenance_filter_entity_type" {
  description = "Entity type for maintenance filter"
  type        = string
}

variable "maintenance_filter_entity_tags" {
  description = "Entity tags for maintenance filter"
  type        = list(string)
}

variable "dashboard_name" {
  description = "Name of the dashboard"
  type        = string
}

variable "dashboard_shared" {
  description = "Enable or disable dashboard sharing"
  type        = bool
}

variable "dashboard_owner" {
  description = "Owner of the dashboard"
  type        = string
}

variable "dashboard_tags" {
  description = "Tags for the dashboard"
  type        = list(string)
}

variable "dashboard_preset" {
  description = "Enable or disable dashboard preset"
  type        = bool
}

variable "metric_name" {
  description = "Name of the metric"
  type        = string
}

variable "autotag_name" {
  description = "Name of the auto tag"
  type        = string
}

variable "generic_relationships_enabled" {
  description = "Enable or disable the generic relationships resource"
  type        = bool
  default     = true
}

variable "generic_relationships_created_by" {
  description = "The user or extension that created this relationship"
  type        = string
  default     = "Terraform"
}

variable "generic_relationships_from_role" {
  description = "Specify a role for the source entity"
  type        = string
  default     = "terraformrole"
}

variable "generic_relationships_from_type" {
  description = "Define an entity type as the source of the relationship"
  type        = string
  default     = "os:service"
}

variable "generic_relationships_to_role" {
  description = "Specify a role for the destination entity"
  type        = string
  default     = "terraformrole"
}

variable "generic_relationships_to_type" {
  description = "Define an entity type as the destination of the relationship"
  type        = string
  default     = "terraformdestination"
}

variable "generic_relationships_type_of_relation" {
  description = "Type of the relationship"
  type        = string
  default     = "PART_OF"
}

variable "generic_relationships_sources_condition" {
  description = "Condition for the source"
  type        = string
  default     = "$eq(terraform)"
}

variable "generic_relationships_sources_source_type" {
  description = "Source type for the relationship"
  type        = string
  default     = "Metrics"
}

variable "generic_types_name" {
  description = "The entity type name"
  type        = string
  default     = "terraform:type"
}

variable "generic_types_enabled" {
  description = "Enable or disable the generic types resource"
  type        = bool
  default     = true
}

variable "generic_types_created_by" {
  description = "The user or extension that created this type"
  type        = string
  default     = "Terraform"
}

variable "generic_types_display_name" {
  description = "The human readable type name for this entity type"
  type        = string
  default     = "TerraformTest"
}

variable "generic_types_rules_icon_pattern" {
  description = "Pattern for the icon attribute"
  type        = string
  default     = "{TerraformIcon}"
}

variable "generic_types_rules_id_pattern" {
  description = "Pattern for the ID attribute"
  type        = string
  default     = "{TerraformPlaceholder}"
}

variable "generic_types_rules_instance_name_pattern" {
  description = "Pattern for the instance name attribute"
  type        = string
  default     = "{TerraformInstance}"
}

variable "generic_types_rules_attributes_key" {
  description = "Key for the attribute"
  type        = string
  default     = "TerraformAttribute"
}

variable "generic_types_rules_attributes_pattern" {
  description = "Pattern for the attribute"
  type        = string
  default     = "{TerraformExtraction}"
}

variable "generic_types_rules_required_dimensions_key" {
  description = "Key for the required dimension"
  type        = string
  default     = "TerraformDimension"
}

variable "generic_types_rules_sources_condition" {
  description = "Condition for the source"
  type        = string
  default     = "$eq(TerraformCondition)"
}

variable "generic_types_rules_sources_source_type" {
  description = "Source type for the rule"
  type        = string
  default     = "Events"
}

variable "grail_security_context_entity_type" {
  description = "Type of the entity whose security context to override"
  type        = string
  default     = "exampletype"
}

variable "grail_security_context_destination_property" {
  description = "The case-sensitive name of a property of the destination type"
  type        = string
  default     = "exampleproperty"
}

variable "alerting_management_zone" {
  description = "Management zone for alerting"
  type        = string
}

variable "maintenance_enabled" {
  description = "Enable or disable maintenance"
  type        = bool
}

variable "auto_update" {
  description = "Automatic updates at earliest convenience"
  type        = bool
}

variable "scope_activegate" {
  description = "The scope of this setting (ENVIRONMENT_ACTIVE_GATE). Omit this property if you want to cover the whole environment."
  type        = string
  default     = "environment"
}


variable "target_version" {
  description = "Target version"
  type        = string
  default     = "latest"
}

variable "update_mode" {
  description = "Update mode"
  type        = string
  default     = "AUTOMATIC"
}

variable "name" {
  description = "Name"
  type        = string
}

variable "enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
}

variable "recurrence" {
  description = "Recurrence type"
  type        = string
  default     = "ONCE"
}

variable "once_recurrence_end" {
  description = "End time for once recurrence"
  type        = string
}

variable "once_recurrence_start" {
  description = "Start time for once recurrence"
  type        = string
}

variable "slo_name" {
  description = "SLO name"
  type        = string
}

variable "slo_enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
  default     = true
}

variable "slo_description" {
  description = "The description of the SLO"
  type        = string
  default     = "Terraform Test"
}

variable "slo_evaluation_type" {
  description = "Evaluation type"
  type        = string
  default     = "AGGREGATE"
}

variable "slo_evaluation_window" {
  description = "Evaluation window"
  type        = string
  default     = "-1w"
}

variable "slo_filter" {
  description = "Filter parameter"
  type        = string
  default     = "type(SERVICE),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)"
}

variable "slo_metric_expression" {
  description = "Metric expression"
  type        = string
  default     = "100*(builtin:service.requestCount.server:splitBy())/(builtin:service.requestCount.server:splitBy())"
}

variable "slo_metric_name" {
  description = "Metric name"
  type        = string
  default     = "terraform_test"
}

variable "slo_target_success" {
  description = "Target success value"
  type        = number
  default     = 95
}

variable "slo_target_warning" {
  description = "Target warning value"
  type        = number
  default     = 98
}

variable "slo_legacy_id" {
  description = "Legacy ID"
  type        = string
  default     = ""
}

variable "burn_rate_visualization_enabled" {
  description = "Burn rate visualization enabled"
  type        = bool
  default     = false
}

variable "fast_burn_threshold" {
  description = "Fast burn threshold"
  type        = number
  default     = null
}
variable "enable_copilot" {
  description = "Enable Davis CoPilot."
  type        = bool
}

variable "enable_tenant_aware_data_mining" {
  description = "Enable tenant-aware data mining."
  type        = bool
}

variable "blocklist_name" {
  description = "Name of the blocklist entry."
  type        = string
}

variable "blocklist_type" {
  description = "Type of the blocklist entry (BUCKET, TABLE)."
  type        = string
}

variable "custom_units_name" {
  description = "Unit name has to be unique and is used as identifier"
  type        = string
}

variable "custom_units_description" {
  description = "Unit description should provide additional information about the new unit"
  type        = string
}

variable "custom_units_plural_name" {
  description = "Unit plural name represents the plural form of the unit name"
  type        = string
}

variable "custom_units_symbol" {
  description = "Unit symbol has to be unique"
  type        = string
}

variable "histogram_metrics_enable_histogram_bucket_ingest" {
  description = "Enable histogram bucket ingest"
  type        = bool
}

variable "metric_metadata_display_name" {
  description = "Display name"
  type        = string
}

variable "metric_metadata_metric_id" {
  description = "The scope of this setting (metric)"
  type        = string
}

variable "metric_metadata_unit" {
  description = "Unit"
  type        = string
}

variable "metric_query_metric_id" {
  description = "The scope of this setting (metric)"
  type        = string
}

variable "metric_query_metric_selector" {
  description = "Query"
  type        = string
}

variable "host_group_id" {
  type = string
}

variable "aspnetcore" {
  type = bool
}

variable "cf_appsmanagerjs" {
  type = bool
}

variable "container" {
  type = bool
}

variable "docker_pauseamd64" {
  type = bool
}

variable "exe_bbs" {
  type = bool
}

variable "exe_caddy" {
  type = bool
}

variable "exe_schedular" {
  type = bool
}

variable "exe_silkdaemon" {
  type = bool
}

variable "go_static" {
  type = bool
}

variable "node_nodegyp" {
  type = bool
}

variable "process_availability_enabled" {
  type = bool
}

variable "process_availability_name" {
  type = string
}

variable "process_availability_rule_property" {
  type = string
}

variable "process_availability_rule_condition" {
  type = string
}

variable "process_availability_metadata_key" {
  type = string
}

variable "process_availability_metadata_value" {
  type = string
}

variable "process_monitoring_host_group_id" {
  type = string
}

variable "process_monitoring_auto_monitoring" {
  type = bool
}

variable "process_monitoring_rule_enabled" {
  type = bool
}

variable "process_monitoring_rule_mode" {
  type = string
}

variable "process_monitoring_rule_host_group_id" {
  type = string
}

variable "process_monitoring_rule_condition_item" {
  type = string
}

variable "process_monitoring_rule_condition_operator" {
  type = string
}

variable "process_monitoring_rule_condition_value" {
  type = string
}

variable "process_visibility_enabled" {
  type = bool
}

variable "process_visibility_max_processes" {
  type = number
}

variable "process_visibility_scope" {
  type = string
}

variable "team_name" {
  description = "Team name"
  type        = string
}

variable "team_description" {
  description = "Description of the team"
  type        = string
}

variable "team_identifier" {
  description = "The team identifier"
  type        = string
}

variable "team_external_id" {
  description = "External ID for automation purposes"
  type        = string
}

variable "responsibility_development" {
  description = "Responsible for development"
  type        = bool
}

variable "responsibility_infrastructure" {
  description = "Responsible for infrastructure"
  type        = bool
}

variable "responsibility_line_of_business" {
  description = "Responsible for line of business"
  type        = bool
}

variable "responsibility_operations" {
  description = "Responsible for operations"
  type        = bool
}

variable "responsibility_security" {
  description = "Responsible for security"
  type        = bool
}

variable "additional_info_key" {
  description = "Key for additional information"
  type        = string
}

variable "additional_info_value" {
  description = "Value for additional information"
  type        = string
}

variable "additional_info_url" {
  description = "URL for additional information"
  type        = string
}

variable "contact_integration_type" {
  description = "Integration type for contact details"
  type        = string
  default     = "JIRA"
}

variable "contact_jira_default_assignee" {
  description = "Default assignee for JIRA"
  type        = string
}

variable "contact_jira_project" {
  description = "Project for JIRA"
  type        = string
}

variable "contact_ms_teams" {
  description = "MS Teams contact"
  type        = string
}

variable "contact_slack_channel" {
  description = "Slack channel contact"
  type        = string
}

variable "contact_url" {
  description = "URL for contact details"
  type        = string
}

variable "link_type" {
  description = "Type of link"
  type        = string
}

variable "link_url" {
  description = "URL for the link"
  type        = string
}

variable "supplementary_identifier" {
  description = "Supplementary identifier"
  type        = string
}

variable "enabled_vmware" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
}

variable "ipaddress" {
  description = "Specify the IP address or name of the vCenter or standalone ESXi host"
  type        = string
}

variable "label" {
  description = "Name this connection"
  type        = string
}

variable "password" {
  description = "Provide the password for the vCenter or standalone ESXi host"
  type        = string
  sensitive   = true
}

variable "username" {
  description = "Provide user credentials for the vCenter or standalone ESXi host"
  type        = string
}

variable "filter" {
  description = "Filter string for the VMware resource"
  type        = string
  default     = ""
}

variable "application_id" {
  description = "The scope of this settings. If the settings should cover the whole environment, just don't specify any scope."
  type        = string
  default     = "environment"
}

variable "enable_resource_capturing" {
  description = "When turned on, Dynatrace captures resources for up to 0.1% of user sessions recorded with Session Replay."
  type        = bool
  default     = true
}

variable "resource_capture_url_exclusion_pattern_list" {
  description = "Add exclusion rules to avoid the capture of resources from certain pages."
  type        = list(string)
  default     = ["www.google.com"]
}

variable "enable_opt_in_mode" {
  description = "When Session Replay opt-in mode is turned on, Session Replay is deactivated until explicitly activated via an API call."
  type        = bool
  default     = false
}

variable "url_exclusion_pattern_list" {
  description = "Exclude webpages or views from Session Replay recording by adding URL exclusion rules."
  type        = list(string)
  default     = ["www.google.com"]
}

variable "playback_masking_preset" {
  description = "Predefined masking options for playback."
  type        = string
  default     = "MASK_ALL"
}

variable "recording_masking_preset" {
  description = "Predefined masking options for recording."
  type        = string
  default     = "ALLOW_LIST"
}

variable "recording_masking_allow_list_rules_css_expression" {
  description = "CSS expression for the allow list rule."
  type        = string
  default     = "selector.example"
}

variable "recording_masking_allow_list_rules_target" {
  description = "Target for the allow list rule."
  type        = string
  default     = "ELEMENT"
}

variable "custom_device_id" {
  type = string
}

variable "display_name" {
  type = string
}

variable "config_url" {
  type = string
}

variable "dns_names" {
  type = list(string)
}

variable "favicon_url" {
  type = string
}

variable "group" {
  type = string
}

variable "ip_addresses" {
  type = list(string)
}

variable "listen_ports" {
  type = list(number)
}

variable "props" {
  type = string
}

variable "type" {
  type = string
}

variable "ui_based" {
  type = bool
}

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

variable "activegate_token_config" {
  description = "Configuration for ActiveGate token"
  type = object({
    auth_token_enforcement_manually_enabled = bool,
    expiring_token_notifications_enabled    = bool
  })
}

variable "ag_token_config" {
  description = "Configuration for AG token"
  type = object({
    type            = string,
    expiration_date = string,
    name            = string
  })
}

variable "api_token_config" {
  description = "Configuration for API token"
  type = object({
    name    = string,
    enabled = bool,
    scopes  = list(string)
  })
}

variable "token_settings_config" {
  description = "Configuration for token settings"
  type = object({
    new_token_format = bool,
    personal_tokens  = bool
  })
}