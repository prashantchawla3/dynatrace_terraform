output "service_detection_rule_ids" {
  value = [for k, v in dynatrace_service_detection_rules.this : v.id]
}
