variable "auto_update" {
  description = "Enable automatic updates for ActiveGate"
  type        = bool
  default     = true
}

variable "scope_activegate" {
  description = "Scope identifier for ActiveGate updates (e.g., host group, environment ID)"
  type        = string
  default     = "environment:default"
}

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

variable "name" {
  description = "Name of the update window applied to OneAgent update scheduling"
  type        = string
  default     = "oneagent-weekend-updates"
}

variable "enabled" {
  description = "Enable or disable the specified update window"
  type        = bool
  default     = true
}

variable "recurrence" {
  description = "Recurrence pattern for the update window (e.g., ONCE, DAILY, WEEKLY)"
  type        = string
  default     = "ONCE"
}

variable "once_recurrence_start" {
  description = "Start timestamp for a one-time update window (RFC3339 format)"
  type        = string
  default     = "2025-08-02T01:00:00Z"
}

variable "once_recurrence_end" {
  description = "End timestamp for a one-time update window (RFC3339 format)"
  type        = string
  default     = "2025-08-02T03:00:00Z"
}
