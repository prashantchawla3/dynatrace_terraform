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
  description = "Name of the alerting configuration"
  type        = string
}

variable "alerting_management_zone" {
  description = "Management zone for alerting"
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
  description = "Connectivity alerts configuration"
  type        = bool
}

variable "process_group_id" {
  description = "Process group ID"
  type        = string
}

variable "maintenance_enabled" {
  description = "Enable or disable maintenance"
  type        = bool
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
  description = "Type of maintenance"
  type        = string
}

variable "maintenance_disable_synthetic" {
  description = "Disable synthetic monitoring during maintenance"
  type        = bool
}

variable "maintenance_suppression" {
  description = "Suppression configuration during maintenance"
  type        = string
}

variable "maintenance_schedule_type" {
  description = "Type of maintenance schedule"
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
  description = "Entity type filter for maintenance"
  type        = string
}

variable "maintenance_filter_entity_tags" {
  description = "Entity tags filter for maintenance"
  type        = list(string)
}

variable "dashboard_name" {
  description = "Name of the dashboard"
  type        = string
}

variable "dashboard_shared" {
  description = "Whether the dashboard is shared"
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
  description = "Preset configuration for the dashboard"
  type        = bool
}

variable "metric_name" {
  description = "Name of the metric"
  type        = string
}
variable "autotag_name" {
  description = "The name of the autotag"
  type        = string
}

