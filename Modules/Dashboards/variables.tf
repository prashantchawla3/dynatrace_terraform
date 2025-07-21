variable "allowlist_urlpatterns" {
  description = "List of URL patterns for the allowlist"
  type = list(object({
    rule     = string
    template = string
  }))
  default = [
    { rule = ".*\\.dynatrace\\.com", template = "standard-template" },
    { rule = ".*\\.example\\.com",    template = "custom-template" }
  ]
}

variable "enable_public_sharing" {
  description = "Enable public sharing for the dashboard"
  type        = bool
  default     = false
}

variable "default_dashboards" {
  description = "List of default dashboards"
  type = list(object({
    dashboard  = string
    user_group = string
  }))
  default = [
    { dashboard = "System Health Overview", user_group = "Operations" },
    { dashboard = "Performance Trends",     user_group = "Engineering" }
  ]
}

variable "enable_dashboard_presets" {
  description = "Enable dashboard presets"
  type        = bool
  default     = true
}

variable "dashboard_presets" {
  description = "List of dashboard presets"
  type = list(object({
    dashboard_preset = string
    user_group       = string
  }))
  default = [
    { dashboard_preset = "Preset-Uptime",  user_group = "SRE" },
    { dashboard_preset = "Preset-Alerts",  user_group = "Security" }
  ]
}

variable "json_dashboards" {
  description = "List of JSON dashboards with full structure"
  type        = any
  default     = []
}
