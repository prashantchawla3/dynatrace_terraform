variable "process_monitoring_rule_enabled" {
  description = "Enable or disable a custom process monitoring rule"
  default     = true
}

variable "process_monitoring_rule_mode" {
  description = "Monitoring mode to apply (e.g., MONITORING_OFF)"
  default     = "MONITORING_OFF"
}

variable "process_monitoring_rule_host_group_id" {
  description = "Host group ID for which the process monitoring rule applies"
  default     = "HOST_GROUP-0000000000000000"
}

variable "process_monitoring_rule_condition_item" {
  description = "Condition item for the process monitoring rule (e.g., APACHE_CONFIG_PATH)"
  default     = "APACHE_CONFIG_PATH"
}

variable "process_monitoring_rule_condition_operator" {
  description = "Operator for the rule condition (e.g., STARTS, EQUALS)"
  default     = "STARTS"
}

variable "process_monitoring_rule_condition_value" {
  description = "Value used in the condition check"
  default     = "foo-bar-x"
}
