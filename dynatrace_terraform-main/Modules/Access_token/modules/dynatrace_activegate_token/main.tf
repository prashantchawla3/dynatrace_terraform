resource "dynatrace_activegate_token" "example" {
  auth_token_enforcement_manually_enabled = var.activegate_token_config.auth_token_enforcement_manually_enabled
  expiring_token_notifications_enabled    = var.activegate_token_config.expiring_token_notifications_enabled
}