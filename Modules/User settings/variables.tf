variable "auto_language" {
  description = "Automatically detect language"
  type        = bool
  default     = true
}

variable "language" {
  description = "Language setting"
  type        = string
  default     = "en"
}

variable "auto_region" {
  description = "Automatically detect region"
  type        = bool
  default     = true
}

variable "region" {
  description = "Region setting"
  type        = string
  default     = "auto"
}

variable "auto_theme" {
  description = "Automatically detect theme"
  type        = bool
  default     = true
}

variable "theme" {
  description = "Theme setting"
  type        = string
  default     = "auto"
}

variable "auto_timezone" {
  description = "Automatically detect timezone"
  type        = bool
  default     = true
}

variable "timezone" {
  description = "Timezone setting"
  type        = string
  default     = "UTC"
}

variable "scope" {
  description = "Scope of the user settings"
  type        = string
  default     = "user-terraform@dynatrace.com"
}