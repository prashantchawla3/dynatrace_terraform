variable "web_app_injection_cookies" {
  description = "Cookie attributes used by Dynatrace JavaScript injection."
  type = list(object({
    application_id              = string
    same_site_cookie_attribute  = string
    use_secure_cookie_attribute = bool
  }))
  default = []
}
