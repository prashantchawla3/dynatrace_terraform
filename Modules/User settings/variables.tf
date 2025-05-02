
variable "environment_url" {
  type = string
}

variable "dynatrace_client_id" {
  type = string
}

variable "dynatrace_client_secret" {
  type = string
  sensitive = true
}
variable "auto_language" {
  description = "Use browser default language"
  type        = bool
  default     = true
}

variable "auto_region" {
  description = "Use browser default region"
  type        = bool
  default     = true
}

variable "auto_theme" {
  description = "Use browser default theme"
  type        = bool
  default     = true
}

variable "auto_timezone" {
  description = "Use browser default timezone"
  type        = bool
  default     = true
}

variable "language" {
  description = "The language for the user settings"
  type        = string
  default     = "en"
}

variable "region" {
  description = "The region for the user settings"
  type        = string
  default     = "auto"
}

variable "theme" {
  description = "The theme for the user settings"
  type        = string
  default     = "auto"
}

variable "timezone" {
  description = "The timezone for the user settings"
  type        = string
  default     = "UTC"
}

variable "scope" {
  description = "The scope of this setting"
  type        = string
  default     = "user-terraform@dynatrace.com"
}
