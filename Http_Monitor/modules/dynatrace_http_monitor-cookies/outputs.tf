output "cookie_monitor_ids" {
  value = [for c in dynatrace_http_monitor_cookies.cookie : c.id]
}
