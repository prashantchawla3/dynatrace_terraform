variable "auth_token_enforcement_manually_enabled" {
  description = "Enable manual enforcement of auth token"
  type        = bool
  default     = true
}

variable "expiring_token_notifications_enabled" {
  description = "Enable notifications for expiring tokens"
  type        = bool
  default     = true
}
