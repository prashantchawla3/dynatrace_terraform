variable "service_naming_name" {
  description = "Name label of the service naming rule."
  type        = string
  default     = "Dynamic Service Name"
}

variable "service_naming_enabled" {
  description = "Enable flag for service naming rule."
  type        = bool
  default     = true
}

variable "service_naming_format" {
  description = "Naming format string with placeholders."
  type        = string
  default     = "{method}-{path}"
}

variable "service_naming_key_type" {
  description = "Type of key used (e.g. REQUEST_ATTRIBUTE)."
  type        = string
  default     = "REQUEST_ATTRIBUTE"
}

variable "service_naming_key_attribute" {
  description = "Key used from request attribute for naming."
  type        = string
  default     = "x-app-name"
}

variable "service_naming_service_type_negate" {
  description = "Negate match logic on service type."
  type        = bool
  default     = false
}

variable "service_naming_service_type_operator" {
  description = "Comparison operator for service type."
  type        = string
  default     = "EQUALS"
}

variable "service_naming_service_type_value" {
  description = "Service type value used for conditional matching (e.g. CUSTOM_SERVICE, WEB_SERVICE)."
  type        = string
  default     = "CUSTOM_SERVICE"
}
variable "service_naming_rule_ids" {
  description = "List of service naming rule IDs in execution order."
  type        = list(string)
  default     = []
}
