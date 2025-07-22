variable "token_settings_config" {
  description = "Configuration for token settings"
  type = object({
    new_token_format = bool
    personal_tokens  = bool
  })
  default = {
    new_token_format = true
    personal_tokens  = false
  }
}