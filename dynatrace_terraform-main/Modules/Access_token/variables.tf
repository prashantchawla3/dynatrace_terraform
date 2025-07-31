variable "auth_token_enforcement_manually_enabled" {
  description = "Whether to manually enforce auth token"
  type        = bool
  default     = false
}

variable "expiring_token_notifications_enabled" {
  description = "Enable notifications for expiring tokens"
  type        = bool
  default     = true
}
variable "type" {
  description = "Type of the AG token"
  type        = string
}

variable "expiration_date" {
  description = "Expiration date of the AG token"
  type        = string
}

variable "ag_name" {
  description = "Name of the AG token"
  type        = string
}

variable "api_name" {
  description = "Name of the API token"
  type        = string
}

variable "enabled" {
  description = "Whether the token is enabled"
  type        = bool
}

variable "scopes" {
  description = "List of scopes for the token"
  type        = list(string)
}

variable "new_token_format" {
  description = "Enable the new token format"
  type        = bool
}

variable "personal_tokens" {
  description = "Allow personal access tokens"
  type        = bool
}
