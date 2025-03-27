variable "alerting_name" {
  description = "The name of the alerting profile, displayed in the UI"
  type        = string
}

variable "alerting_management_zone" {
  description = "Entities which are part of the configured management zones will match this alerting profile. It is recommended to use manual tags instead."
  type        = string
  default     = ""
}

variable "alerting_rule_1_tags" {
  description = "Tags for rule 1"
  type        = list(string)
  default     = ["EnvironmentA:production", "Team:test"]
}

variable "alerting_rule_1_delay_in_minutes" {
  description = "Delay in minutes for rule 1"
  type        = number
  default     = 0
}

variable "alerting_rule_1_severity_level" {
  description = "Severity level for rule 1"
  type        = string
  default     = "AVAILABILITY"
}

variable "alerting_rule_2_tags" {
  description = "Tags for rule 2"
  type        = list(string)
  default     = ["EnvironmentB:production", "Team:test"]
}

variable "alerting_rule_2_delay_in_minutes" {
  description = "Delay in minutes for rule 2"
  type        = number
  default     = 0
}

variable "alerting_rule_2_severity_level" {
  description = "Severity level for rule 2"
  type        = string
  default     = "CUSTOM_ALERT"
}

variable "alerting_rule_3_tags" {
  description = "Tags for rule 3"
  type        = list(string)
  default     = ["EnvironmentC:production", "Team:test"]
}

variable "alerting_rule_3_delay_in_minutes" {
  description = "Delay in minutes for rule 3"
  type        = number
  default     = 0
}

variable "alerting_rule_3_severity_level" {
  description = "Severity level for rule 3"
  type        = string
  default     = "ERRORS"
}

variable "alerting_rule_4_tags" {
  description = "Tags for rule 4"
  type        = list(string)
  default     = ["EnvironmentD:production", "Team:test"]
}

variable "alerting_rule_4_delay_in_minutes" {
  description = "Delay in minutes for rule 4"
  type        = number
  default     = 0
}

variable "alerting_rule_4_severity_level" {
  description = "Severity level for rule 4"
  type        = string
  default     = "MONITORING_UNAVAILABLE"
}

variable "alerting_rule_5_tags" {
  description = "Tags for rule 5"
  type        = list(string)
  default     = ["EnvironmentE:production", "Team:test"]
}

variable "alerting_rule_5_delay_in_minutes" {
  description = "Delay in minutes for rule 5"
  type        = number
  default     = 0
}

variable "alerting_rule_5_severity_level" {
  description = "Severity level for rule 5"
  type        = string
  default     = "PERFORMANCE"
}

variable "alerting_rule_6_tags" {
  description = "Tags for rule 6"
  type        = list(string)
  default     = ["EnvironmentF:production", "Team:test"]
}

variable "alerting_rule_6_delay_in_minutes" {
  description = "Delay in minutes for rule 6"
  type        = number
  default     = 0
}

variable "alerting_rule_6_severity_level" {
  description = "Severity level for rule 6"
  type        = string
  default     = "RESOURCE_CONTENTION"
}

variable "connectivity_alerts" {
  description = "TCP connectivity problems"
  type        = bool
}

variable "process_group_id" {
  description = "The scope of this setting"
  type        = string
}

variable "maintenance_enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
  default     = true
}

variable "maintenance_name" {
  description = "The name of the maintenance window, displayed in the UI"
  type        = string
}

variable "maintenance_description" {
  description = "A short description of the maintenance purpose"
  type        = string
  default     = "Terraform test execution"
}

variable "maintenance_type" {
  description = "The type of the maintenance, possible values: PLANNED or UNPLANNED"
  type        = string
  default     = "PLANNED"
}

variable "maintenance_disable_synthetic" {
  description = "Disables the execution of the synthetic monitors that are within the scope of this maintenance window"
  type        = bool
  default     = true
}

variable "maintenance_suppression" {
  description = "The type of suppression of alerting and problem detection during the maintenance. Possible Values: DETECT_PROBLEMS_AND_ALERT, DETECT_PROBLEMS_DONT_ALERT, DONT_DETECT_PROBLEMS"
  type        = string
  default     = "DETECT_PROBLEMS_AND_ALERT"
}

variable "maintenance_schedule_type" {
  description = "The type maintenance window, possible values: DAILY, MONTHLY, ONCE, WEEKLY"
  type        = string
  default     = "WEEKLY"
}

variable "maintenance_weekly_day_of_week" {
  description = "The day of the week for weekly maintenance, possible values: FRIDAY, MONDAY, SATURDAY, SUNDAY, THURSDAY, TUESDAY, WEDNESDAY"
  type        = string
  default     = "MONDAY"
}

variable "maintenance_weekly_end_date" {
  description = "The end date of the recurrence range in YYYY-MM-DD format"
  type        = string
  default     = "2022-10-06"
}

variable "maintenance_weekly_start_date" {
  description = "The start date of the recurrence range in YYYY-MM-DD format"
  type        = string
  default     = "2022-10-05"
}

variable "maintenance_weekly_end_time" {
  description = "The end time of the maintenance window validity period in hh:mm:ss format"
  type        = string
  default     = "15:13:00"
}

variable "maintenance_weekly_start_time" {
  description = "The start time of the maintenance window validity period in hh:mm:ss format"
  type        = string
  default     = "14:13:00"
}

variable "maintenance_weekly_time_zone" {
  description = "The time zone of the start and end time. Default time zone is UTC. You can use either UTC offset UTC+01:00 format or the IANA Time Zone Database format (for example, Europe/Vienna)"
  type        = string
  default     = "UTC"
}

variable "maintenance_filter_entity_type" {
  description = "Type of entities this maintenance window should match. If no entity type is selected all entities regardless of the type will match."
  type        = string
  default     = "HOST"
}

variable "maintenance_filter_entity_tags" {
  description = "Entities which contain all of the configured tags will match this maintenance window."
  type        = list(string)
  default     = ["KeyTest:ValueTest"]
}