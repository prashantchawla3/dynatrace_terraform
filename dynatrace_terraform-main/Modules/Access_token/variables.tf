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

variable "ag_token_config" {
  description = "Configuration for AG token"
  type = object({
    type            = string
    expiration_date = string
    name            = string
  })
  default = {
    type            = "AG"
    expiration_date = "2025-12-31"
    name            = "default-ag-token"
  }
}

variable "api_token_config" {
  description = "Configuration for API token"
  type = object({
    name    = string
    enabled = bool
    scopes  = list(string)
  })
  default = {
    name    = "default-api-token"
    enabled = true
    scopes  = ["DataExport", "ReadConfig", "WriteConfig"]
  }
}

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
