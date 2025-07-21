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