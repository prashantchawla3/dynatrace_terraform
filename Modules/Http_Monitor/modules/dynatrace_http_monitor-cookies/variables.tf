variable "http_monitor_cookies" {
  description = "List of HTTP monitor cookie configurations, scoped by entity. Each cookie block defines visibility and cookie parameters."
  type = list(object({
    enabled = bool
    scope   = string
    cookies = list(object({
      name   = string
      domain = string
      value  = string
    }))
  }))
  default = [
    {
      enabled = true
      scope   = "monitor:europe-login"
      cookies = [
        { name = "session", domain = "login.example.com", value = "abc123" },
        { name = "auth", domain = "login.example.com", value = "tokenXYZ" }
      ]
    }
  ]
}
