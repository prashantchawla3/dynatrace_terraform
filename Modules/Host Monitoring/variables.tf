variable "host_id" {
  description = "The ID of the host"
  type        = string
}

variable "use_global_settings" {
  description = "Use global settings"
  type        = bool
  default     = false
}

variable "enabled" {
  description = "Enable or disable the setting"
  type        = bool
  default     = true
}

variable "scope" {
  description = "The scope of the setting"
  type        = string
}

variable "monitoring_mode" {
  description = "Monitoring mode"
  type        = string
  default     = "FULL_STACK"
}

variable "format" {
  description = "Format for naming rule"
  type        = string
}

variable "monitoring_state" {
  description = "Monitoring state"
  type        = string
  default     = "MONITORING_ON"
}

variable "net_tracer" {
  description = "Enable or disable NetTracer"
  type        = bool
  default     = true
}

variable "ip_address" {
  description = "IP address to exclude"
  type        = string
}

variable "interface" {
  description = "Network interface to exclude"
  type        = string
}

variable "os" {
  description = "Operating system type"
  type        = string
  default     = "OS_TYPE_WINDOWS"
}

variable "alert_activation_duration" {
  description = "Duration before alert activation"
  type        = number
  default     = 5
}

variable "status_condition_linux" {
  description = "Status condition for Linux services"
  type        = string
  default     = "$eq(failed)"
}

variable "system" {
  description = "System type"
  type        = string
  default     = "LINUX"
}

variable "metadata_key" {
  description = "Metadata key"
  type        = string
}

variable "metadata_value" {
  description = "Metadata value"
  type        = string
}

variable "enable_crash_dump_analytics" {
  description = "Enable crash dump analytics"
  type        = bool
  default     = true
}

variable "process_agent_injection" {
  description = "Process agent injection"
  type        = bool
  default     = true
}

variable "code_module_injection" {
  description = "Code module injection"
  type        = bool
  default     = true
}

variable "host_id_mode" {
  description = "Host ID for monitoring mode"
  type        = string
}

variable "name" {
  description = "Name of the rule"
  type        = string
}

variable "process_group" {
  description = "Process group"
  type        = string
}

variable "alerting" {
  description = "Enable or disable alerting"
  type        = bool
  default     = true
}

variable "monitoring" {
  description = "Enable or disable monitoring"
  type        = bool
  default     = true
}

variable "not_installed_alerting" {
  description = "Alert if service is not installed"
  type        = bool
  default     = true
}

variable "condition" {
  description = "Condition for detection"
  type        = string
}

variable "property" {
  description = "Property for detection"
  type        = string
}

variable "ebpf" {
  description = "Enable or disable eBPF service discovery"
  type        = bool
  default     = true
}