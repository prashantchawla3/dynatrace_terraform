output "dynatrace_web_app_injection_cookie_ids" {
  value = [for cookie in dynatrace_web_app_injection_cookie.web_app_injection_cookie : cookie.id]
}
