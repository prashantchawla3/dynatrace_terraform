resource "dynatrace_process_monitoring_rule" "process_monitoring_rule" {
  enabled       = var.process_monitoring_rule_enabled
  mode          = var.process_monitoring_rule_mode
  host_group_id = var.process_monitoring_rule_host_group_id
  condition {
    item     = var.process_monitoring_rule_condition_item
    operator = var.process_monitoring_rule_condition_operator
    value    = var.process_monitoring_rule_condition_value
  }
}