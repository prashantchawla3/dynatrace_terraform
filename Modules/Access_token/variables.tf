
variable "environment_url" {
  description = "Dynatrace environment URL"
  type        = string
}

variable "dynatrace_client_id" {
  description = "OAuth client ID"
  type        = string
}

variable "dynatrace_client_secret" {
  description = "OAuth client secret"
  type        = string
  sensitive   = true
}

variable "activegate_token_config" {
  description = "Configuration for ActiveGate token"
  type = object({
    auth_token_enforcement_manually_enabled = bool
    expiring_token_notifications_enabled    = bool
  })
}

variable "ag_token_config" {
  description = "Configuration for AG token"
  type = object({
    type            = string
    expiration_date = string
    name            = string
  })
}

variable "api_token_config" {
  description = "Configuration for API token"
  type = object({
    name    = string
    enabled = bool
    scopes  = list(string)
  })
}

variable "token_settings_config" {
  description = "Configuration for token settings"
  type = object({
    new_token_format = bool
    personal_tokens  = bool
  })
}
