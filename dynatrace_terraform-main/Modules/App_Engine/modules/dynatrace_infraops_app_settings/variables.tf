variable "infraops_settings_count" {
  description = "Number of InfraOps app settings resources to create"
  type        = number
  default     = 1
}

variable "infraops_show_monitoring_candidates" {
  description = "Whether to highlight monitoring candidates within InfraOps views"
  type        = bool
  default     = true
}

variable "infraops_show_standalone_hosts" {
  description = "Whether to display standalone (non-clustered) hosts in InfraOps"
  type        = bool
  default     = true
}

variable "infraops_interface_saturation_threshold" {
  description = "Threshold percentage (0–100) used to evaluate saturated network interfaces"
  type        = number
  default     = 85
}