resource "dynatrace_activegate_token" "example" {
  auth_token_enforcement_manually_enabled = var.auth_token_enforcement_manually_enabled
  expiring_token_notifications_enabled    = var.expiring_token_notifications_enabled
}
