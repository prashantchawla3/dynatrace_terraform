output "dynatrace_web_app_key_performance_custom_ids" {
  value = [for custom in dynatrace_web_app_key_performance_custom.web_app_key_performance_custom : custom.id]
}
