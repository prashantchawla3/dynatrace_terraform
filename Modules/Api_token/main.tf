resource "dynatrace_activegate_token" "example" {
  auth_token_enforcement_manually_enabled = var.activegate_token_config.auth_token_enforcement_manually_enabled
  expiring_token_notifications_enabled    = var.activegate_token_config.expiring_token_notifications_enabled
}

resource "dynatrace_ag_token" "example" {
  type            = var.ag_token_config.type
  expiration_date = var.ag_token_config.expiration_date
  name            = var.ag_token_config.name
}

resource "dynatrace_api_token" "example" {
  name    = var.api_token_config.name
  enabled = var.api_token_config.enabled
  scopes  = var.api_token_config.scopes
}

resource "dynatrace_token_settings" "example" {
  new_token_format = var.token_settings_config.new_token_format
  personal_tokens  = var.token_settings_config.personal_tokens
}

data "dynatrace_api_token" "example" {
  name = var.api_token_config.name
}

data "dynatrace_api_tokens" "example" {
  # Configuration to retrieve all API tokens
}