output "dynatrace_web_app_key_performance_load_ids" {
  value = [for load in dynatrace_web_app_key_performance_load.web_app_key_performance_load : load.id]
}
