variable "maintenance_enabled" {
  description = "Flag to enable or disable the maintenance resource"
  type        = bool
  default     = true
}

variable "maintenance_name" {
  description = "Name of the maintenance window"
  type        = string
  default     = "Default Maintenance"
}

variable "maintenance_description" {
  description = "Description of the maintenance window"
  type        = string
  default     = "Scheduled maintenance window"
}

variable "maintenance_type" {
  description = "Type of the maintenance window"
  type        = string
  default     = "PLANNED"
}

variable "maintenance_disable_synthetic" {
  description = "Flag to disable synthetic monitoring during maintenance"
  type        = bool
  default     = true
}

variable "maintenance_suppression" {
  description = "Suppression mode during maintenance"
  type        = string
  default     = "DETECT_PROBLEMS_AND_ALERT"
}

variable "schedule_type" {
  description = "Type of the schedule"
  type        = string
  default     = "WEEKLY"
}

variable "weekly_recurrence_day_of_week" {
  description = "Day of the week for weekly recurrence"
  type        = string
  default     = "MONDAY"
}

variable "recurrence_range_end_date" {
  description = "End date of the recurrence range"
  type        = string
  default     = "2025-12-31"
}

variable "recurrence_range_start_date" {
  description = "Start date of the recurrence range"
  type        = string
  default     = "2025-01-01"
}

variable "time_window_end_time" {
  description = "End time of the time window"
  type        = string
  default     = "18:00"
}

variable "time_window_start_time" {
  description = "Start time of the time window"
  type        = string
  default     = "09:00"
}

variable "time_window_time_zone" {
  description = "Time zone of the time window"
  type        = string
  default     = "UTC"
}

variable "filters" {
  description = "List of filters for the maintenance window"
  type = list(object({
    entity_type = string
    entity_tags = list(string)
  }))
  default = [
    {
      entity_type = "SERVICE"
      entity_tags = ["Environment:Production"]
    }
  ]
}
