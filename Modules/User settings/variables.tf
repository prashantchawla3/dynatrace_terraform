variable "user_settings" {
  description = "Map of user settings configurations"
  type = map(object({
    auto_language  = bool
    auto_region    = bool
    auto_theme     = bool
    auto_timezone  = bool
    language       = string
    region         = string
    theme          = string
    timezone       = string
    scope          = string
  }))
}
