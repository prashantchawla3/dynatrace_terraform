variable "enable_connectivity_alerts" {
  description = "Flag to enable or disable the connectivity alerts resource"
  type        = bool
  default     = true
}

variable "connectivity_alerts" {
  description = "Whether connectivity alerts are enabled"
  type        = bool
  default     = false
}

variable "process_group_id" {
  description = "ID of the process group for connectivity alerts"
  type        = string
  default     = "PROCESS_GROUP-EXAMPLE"
}