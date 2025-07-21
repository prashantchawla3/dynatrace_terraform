output "dynatrace_application_detection_rule_v2_ids" {
  value = [for rule in dynatrace_application_detection_rule_v2.app_detection_rule : rule.id]
}