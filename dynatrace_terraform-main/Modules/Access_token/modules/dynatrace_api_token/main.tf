resource "dynatrace_api_token" "example" {
  name    = var.api_token_config.name
  enabled = var.api_token_config.enabled
  scopes  = var.api_token_config.scopes
}