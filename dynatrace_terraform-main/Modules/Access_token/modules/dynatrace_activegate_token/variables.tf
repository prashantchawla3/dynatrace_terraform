variable "activegate_token_config" {
  description = "Configuration for ActiveGate token"
  type = object({
    auth_token_enforcement_manually_enabled = bool
    expiring_token_notifications_enabled    = bool
  })
  default = {
    auth_token_enforcement_manually_enabled = true
    expiring_token_notifications_enabled    = true
  }
}
