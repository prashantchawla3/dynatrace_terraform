output "dynatrace_web_app_key_performance_xhr_ids" {
  value = [for xhr in dynatrace_web_app_key_performance_xhr.web_app_key_performance_xhr : xhr.id]
}
