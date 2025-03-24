variable "auto_language" {
  description = "Language - use browser default"
  type        = bool
}

variable "auto_region" {
  description = "Region - use browser default"
  type        = bool
}

variable "auto_theme" {
  description = "Theme - use browser default"
  type        = bool
}

variable "auto_timezone" {
  description = "Timezone - use browser default"
  type        = bool
}

variable "scope" {
  description = "The scope of this setting (user, userdefaults)"
  type        = string
}

variable "language" {
  description = "Language"
  type        = string
  default     = "en"
}

variable "region" {
  description = "Region"
  type        = string
  default     = "auto"
}

variable "theme" {
  description = "Theme"
  type        = string
  default     = "auto"
}

variable "timezone" {
  description = "Timezone"
  type        = string
  default     = "UTC"
}
