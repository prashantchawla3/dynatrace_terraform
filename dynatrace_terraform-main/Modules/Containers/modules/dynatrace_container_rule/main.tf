resource "dynatrace_container_rule" "this" {
  count    = var.container_rule_enabled ? 1 : 0
  enabled  = var.container_rule_enabled
  mode     = var.container_rule_mode
  operator = var.container_rule_operator
  property = var.container_rule_property
  value    = var.container_rule_value
}
