# Dynatrace Alerting Profile module variables

# Basic profile properties
variable "name" {
  description = "Name of the Dynatrace alerting profile"
  type        = string
}
variable "description" {
  description = "Description of the alerting profile"
  type        = string
  default     = ""
}
variable "management_zone_id" {
  description = "ID (legacy ID) of the Dynatrace management zone to scope alerts"
  type        = string
  default     = ""   # Optional: leave empty for no zone scoping
}

# Severity rules for the alerting profile (block list)
variable "rules" {
  description = <<-EOT
    List of severity rules for the alerting profile. 
    Each rule requires:
      - severity_level: the problem type (e.g. "ERRORS", "PERFORMANCE")
      - delay_in_minutes: minutes before sending notification
      - include_mode: tag inclusion mode ("NONE", "INCLUDE_ANY", "INCLUDE_ALL")
    Optional:
      - tag_filter_include_mode: another inclusion mode for tags
      - tags: list of tags to filter on
  EOT
  type = list(object({
    severity_level          = string
    delay_in_minutes        = number
    include_mode            = string
    tag_filter_include_mode = optional(string)
    tags                    = optional(list(string))
  }))
  default = []
}

# Event filters for the alerting profile (block list)
variable "filters" {
  description = <<-EOT
    List of event filters for the alerting profile. Each filter block can have:
      - type: "PREDEFINED" or "CUSTOM"
      - For PREDEFINED:
          - predefined_event_type (string, e.g. "APPLICATION_SLOWDOWN")
          - predefined_negate (bool)
      - For CUSTOM:
          - custom_title_operator (string, e.g. "CONTAINS")
          - custom_title_value (string)
          - custom_title_negate (bool)
          - custom_title_enabled (bool)
          - custom_title_case_sensitive (bool)
          - custom_description_operator, custom_description_value, etc. for description
          - custom_metadata: list of { key, value, negate } for event properties
  EOT
  type = list(object({
    type                         = string
    predefined_event_type        = optional(string)
    predefined_negate            = optional(bool)
    custom_title_operator        = optional(string)
    custom_title_value           = optional(string)
    custom_title_negate          = optional(bool)
    custom_title_enabled         = optional(bool)
    custom_title_case_sensitive  = optional(bool)
    custom_description_operator  = optional(string)
    custom_description_value     = optional(string)
    custom_description_negate    = optional(bool)
    custom_description_enabled   = optional(bool)
    custom_description_case_sensitive = optional(bool)
    custom_metadata              = optional(list(object({
      key   = string
      value = string
      negate = bool
    })))
  }))
  default = []
}

# Optional connectivity alerts configuration (for process groups)
variable "connectivity_alerts" {
  description = <<-EOT
    Optional list of connectivity alert settings. 
    Each entry requires:
      - process_group_id (string): the Dynatrace Process Group ID
      - enable (bool): true to enable TCP connectivity problem alerts
  EOT
  type = map(object({
    process_group_id = string
    enable           = bool
  }))
  default = {}
}

# Optional maintenance windows configuration
variable "maintenance_windows" {
  description = <<-EOT
    Optional list of maintenance window configurations. Each object can include:
      - enabled (bool)
      - name (string)
      - description (string, optional)
      - maintenance_type (string, e.g. "PLANNED" or "UNPLANNED")
      - suppression (string, e.g. "DETECT_PROBLEMS_DONT_ALERT")
      - disable_synthetic (bool)
      - management_zones (list of IDs, optional)
      - tags (list of strings, optional)
      - entity_id (string, optional)
      - schedule_type (string, "ONCE"/"DAILY"/"WEEKLY"/"MONTHLY")
      - start_date, end_date (YYYY-MM-DD)
      - start_time, end_time (HH:mm)
      - time_zone (string)
      - days_of_week (list of strings, e.g. ["SATURDAY","SUNDAY"])
      - day_of_month (number, e.g. 15)
  EOT
  type = map(object({
    enabled     = bool
    name        = string
    description = optional(string)
    maintenance_type = string
    suppression = string
    disable_synthetic = bool
    management_zones = optional(list(string))
    tags         = optional(list(string))
    entity_id    = optional(string)
    schedule_type   = string
    start_date   = optional(string)
    end_date     = optional(string)
    start_time   = string
    end_time     = string
    time_zone    = string
    days_of_week = optional(list(string))
    day_of_month = optional(number)
  }))
  default = {}
}
