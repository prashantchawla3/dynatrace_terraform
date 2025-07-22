variable "process_availability_enabled" {
  description = "Boolean to enable or disable process availability monitoring."
  type        = bool
  default     = true
}

variable "process_availability_name" {
  description = "The name of the process availability configuration."
  type        = string
  default     = "example-process-availability"
}

variable "process_availability_rule_property" {
  description = "The property name used in the availability rule condition (e.g., EXE, COMMAND_LINE, etc.)."
  type        = string
  default     = "EXE"
}

variable "process_availability_rule_condition" {
  description = "The condition value to match for the specified rule property."
  type        = string
  default     = "nginx"
}

variable "process_availability_metadata_key" {
  description = "The key of the metadata item to be added to the availability configuration."
  type        = string
  default     = "environment"
}

variable "process_availability_metadata_value" {
  description = "The value of the metadata item to be added to the availability configuration."
  type        = string
  default     = "production"
}
