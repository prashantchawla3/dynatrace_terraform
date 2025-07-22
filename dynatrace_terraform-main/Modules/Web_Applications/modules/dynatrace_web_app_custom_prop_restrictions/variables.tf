variable "application_id" {
  description = "Logical application ID used across web app modules."
  type        = string
  default     = "web-frontend-africa"
}

variable "custom_event_properties_allow_list" {
  description = "Allow list of custom event fields (grouped by rule set). Each inner list contains objects defining the allowed event properties by data type and field name."
  type = list(list(object({
    field_data_type = string
    field_name      = string
  })))
  default = []
}

variable "custom_session_properties_allow_list" {
  description = "Allow list of custom session fields (grouped by rule set). Each inner list contains objects defining the allowed session properties by data type and field name."
  type = list(list(object({
    field_data_type = string
    field_name      = string
  })))
  default = []
}
