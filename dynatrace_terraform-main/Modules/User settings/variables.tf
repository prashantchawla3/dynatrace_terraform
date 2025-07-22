variable "user_settings" {
  description = "Map of user profile configurations, supporting both automatic and custom overrides across language, region, theme, and timezone preferences scoped per user or domain."
  type = map(object({
    auto_language = bool
    auto_region   = bool
    auto_theme    = bool
    auto_timezone = bool
    language      = string
    region        = string
    theme         = string
    timezone      = string
    scope         = string
  }))
  default = {
    user01 = {
      auto_language = true
      auto_region   = true
      auto_theme    = false
      auto_timezone = false
      language      = "en"
      region        = "US"
      theme         = "dark"
      timezone      = "America/New_York"
      scope         = "user:john.doe@example.com"
    }

    user02 = {
      auto_language = false
      auto_region   = false
      auto_theme    = true
      auto_timezone = true
      language      = "fr"
      region        = "EU"
      theme         = "light"
      timezone      = "Europe/Paris"
      scope         = "user:jane.smith@example.com"
    }
  }
}
