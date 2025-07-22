output "dynatrace_web_app_custom_injection_ids" {
  value = [for injection in dynatrace_web_app_custom_injection.web_app_custom_injection : injection.id]
}
