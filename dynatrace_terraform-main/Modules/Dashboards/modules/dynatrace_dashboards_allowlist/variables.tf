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