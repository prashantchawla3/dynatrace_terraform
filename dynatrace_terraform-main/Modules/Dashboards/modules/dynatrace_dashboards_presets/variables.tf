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
