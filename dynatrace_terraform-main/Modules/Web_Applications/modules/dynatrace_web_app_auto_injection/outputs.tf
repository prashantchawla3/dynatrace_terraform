output "dynatrace_web_app_auto_injection_ids" {
  value = [for injection in dynatrace_web_app_auto_injection.web_app_auto_injection : injection.id]
}
