variable "scope_oneagent" {
  description = "Scope identifier for OneAgent updates (e.g., host ID, tag, environment)"
  type        = string
  default     = "environment:default"
}

variable "target_version" {
  description = "Target OneAgent version to upgrade or rollback to"
  type        = string
  default     = "1.287.0.202"
}

variable "update_mode" {
  description = "Update strategy for OneAgent deployment (e.g., AUTO, MANUAL, SCHEDULED)"
  type        = string
  default     = "SCHEDULED"
}
