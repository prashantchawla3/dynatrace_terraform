resource "dynatrace_web_app_injection_cookie" "web_app_injection_cookie" {
  count                       = length(var.web_app_injection_cookies)
  application_id              = var.web_app_injection_cookies[count.index].application_id
  same_site_cookie_attribute  = var.web_app_injection_cookies[count.index].same_site_cookie_attribute
  use_secure_cookie_attribute = var.web_app_injection_cookies[count.index].use_secure_cookie_attribute
}
