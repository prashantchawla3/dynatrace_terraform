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
