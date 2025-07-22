
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