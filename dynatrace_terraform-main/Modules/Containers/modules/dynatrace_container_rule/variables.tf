variable "container_rule_enabled" {
  description = "Enable or disable creation of dynatrace_container_rule"
  type        = bool
  default     = true
}

variable "container_rule_mode" {
  description = "Mode of the container rule (e.g., EXCLUDE)"
  type        = string
  default     = "EXCLUDE"
}

variable "container_rule_operator" {
  description = "Operator to use for the rule (e.g., EQUALS)"
  type        = string
  default     = "EQUALS"
}

variable "container_rule_property" {
  description = "Property to match in the rule (e.g., CONTAINER_NAME)"
  type        = string
  default     = "CONTAINER_NAME"
}

variable "container_rule_value" {
  description = "Value to match in the rule"
  type        = string
  default     = ""
}
