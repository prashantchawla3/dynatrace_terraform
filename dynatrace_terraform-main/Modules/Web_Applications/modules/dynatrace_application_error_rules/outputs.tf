output "dynatrace_application_error_rules_ids" {
  value = [for rule in dynatrace_application_error_rules.app_error_rules : rule.id]
}
