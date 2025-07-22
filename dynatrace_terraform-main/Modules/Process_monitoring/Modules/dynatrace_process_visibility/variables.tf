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
