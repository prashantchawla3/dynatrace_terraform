resource "dynatrace_failure_detection_rules" "this" {
  count = var.failure_detection_rules_enabled ? 1 : 0
  name = var.failure_detection_rules_name

}
