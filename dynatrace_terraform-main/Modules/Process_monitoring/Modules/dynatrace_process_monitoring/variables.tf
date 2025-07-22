variable "process_monitoring_host_group_id" {
  description = "The ID of the host group where process monitoring should be applied."
  type        = string
  default     = "HOST_GROUP_ID"
}

variable "process_monitoring_auto_monitoring" {
  description = "Boolean to enable or disable automatic process monitoring."
  type        = bool
  default     = true
}
