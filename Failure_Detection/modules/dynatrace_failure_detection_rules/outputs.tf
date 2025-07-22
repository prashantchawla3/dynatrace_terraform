output "failure_detection_rules_id" {
  value = var.failure_detection_rules_enabled ? dynatrace_failure_detection_rules.this[0].id : null
}
