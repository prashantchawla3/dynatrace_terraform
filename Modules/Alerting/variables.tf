variable "alerting_name" {
  description = "Name of the Dynatrace alerting profile"
  type        = string
}

variable "management_zone" {
  description = "Management zone for the alerting profile"
  type        = string
}

variable "rules" {
  description = "List of alerting rules"
  type = list(object({
    include_mode     = string
    tags             = list(string)
    delay_in_minutes = number
    severity_level   = string
  }))
}

variable "enable_connectivity_alerts" {
  description = "Flag to enable or disable the connectivity alerts resource"
  type        = bool
  default     = false
}

variable "connectivity_alerts" {
  description = "Whether connectivity alerts are enabled"
  type        = bool
}

variable "process_group_id" {
  description = "ID of the process group for connectivity alerts"
  type        = string
}

variable "maintenance_enabled" {
  description = "Flag to enable or disable the maintenance resource"
  type        = bool
  default     = true
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
  description = "Flag to disable synthetic monitoring during maintenance"
  type        = bool
}

variable "maintenance_suppression" {
  description = "Suppression mode during maintenance"
  type        = string
}

variable "schedule_type" {
  description = "Type of the schedule"
  type        = string
}

variable "weekly_recurrence_day_of_week" {
  description = "Day of the week for weekly recurrence"
  type        = string
}

variable "recurrence_range_end_date" {
  description = "End date of the recurrence range"
  type        = string
}

variable "recurrence_range_start_date" {
  description = "Start date of the recurrence range"
  type        = string
}

variable "time_window_end_time" {
  description = "End time of the time window"
  type        = string
}

variable "time_window_start_time" {
  description = "Start time of the time window"
  type        = string
}

variable "time_window_time_zone" {
  description = "Time zone of the time window"
  type        = string
}

variable "filters" {
  description = "List of filters for the maintenance window"
  type = list(object({
    entity_type = string
    entity_tags = list(string)
  }))
}
