variable "auto_delete_mode" {
  description = "Mode for the golden_state_auto_delete resource (e.g., 'strict', 'lazy')"
  type        = string
  default     = "strict"
}

variable "auto_delete_management_zone_ids" {
  description = "List of management zone IDs where auto deletion applies"
  type        = list(string)
  default     = ["mz-ops", "mz-legacy"]
}

variable "auto_delete_alerting_ids" {
  description = "List of alerting configuration IDs to be auto-deleted"
  type        = list(string)
  default     = ["alert-high-memory", "alert-old-sla"]
}

variable "warn_mode" {
  description = "Mode for the golden_state_warn resource (e.g., 'log-only', 'notify')"
  type        = string
  default     = "notify"
}

variable "warn_autotag_ids" {
  description = "List of autotag IDs used to trigger warnings"
  type        = list(string)
  default     = ["tag-expired", "tag-risky"]
}
