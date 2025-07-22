variable "host_group_id" {
  description = "Dynatrace host group ID for process monitoring"
  default     = "environment"
}

variable "aspnetcore" {
  description = "Enable monitoring for ASP.NET Core processes"
  default     = false
}

variable "cf_appsmanagerjs" {
  description = "Enable monitoring for Cloud Foundry Apps Manager JS"
  default     = false
}

variable "container" {
  description = "Enable monitoring for container processes"
  default     = false
}

variable "docker_pauseamd64" {
  description = "Enable monitoring for Docker pause-amd64 process"
  default     = false
}

variable "exe_bbs" {
  description = "Enable monitoring for BBS executable"
  default     = false
}

variable "exe_caddy" {
  description = "Enable monitoring for Caddy executable"
  default     = false
}

variable "exe_schedular" {
  description = "Enable monitoring for Scheduler executable"
  default     = false
}

variable "exe_silkdaemon" {
  description = "Enable monitoring for Silk Daemon executable"
  default     = false
}

variable "go_static" {
  description = "Enable monitoring for Go static binaries"
  default     = false
}

variable "node_nodegyp" {
  description = "Enable monitoring for Node.js node-gyp processes"
  default     = false
}

variable "process_availability_enabled" {
  description = "Enable or disable process availability monitoring"
  default     = true
}

variable "process_availability_name" {
  description = "Name for the process availability rule"
  default     = "Process Availability Rule"
}

variable "process_availability_rule_property" {
  description = "Property for the process availability rule condition"
  default     = "executable"
}

variable "process_availability_rule_condition" {
  description = "Condition for the process availability rule"
  default     = "$contains(svc)"
}

variable "process_availability_metadata_key" {
  description = "Metadata key for the process availability rule"
  default     = "foo"
}

variable "process_availability_metadata_value" {
  description = "Metadata value for the process availability rule"
  default     = "bar"
}

variable "process_monitoring_host_group_id" {
  description = "Host group ID for the process monitoring configuration"
  default     = "HOST_GROUP-0000000000000000"
}

variable "process_monitoring_auto_monitoring" {
  description = "Enable or disable automatic process monitoring"
  default     = true
}

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

variable "process_visibility_enabled" {
  description = "Enable or disable process visibility monitoring"
  default     = true
}

variable "process_visibility_max_processes" {
  description = "Maximum number of processes to monitor"
  default     = 80
}

variable "process_visibility_scope" {
  description = "Scope for the process visibility setting"
  default     = "environment"
}
