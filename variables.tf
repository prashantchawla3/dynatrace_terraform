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

variable "scope_oneagent" {
  description = "The scope of this setting (HOST, HOST_GROUP). Omit this property if you want to cover the whole environment."
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
