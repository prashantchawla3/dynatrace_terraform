
resource "dynatrace_token_settings" "example" {
  new_token_format = var.token_settings_config.new_token_format
  personal_tokens  = var.token_settings_config.personal_tokens
}
