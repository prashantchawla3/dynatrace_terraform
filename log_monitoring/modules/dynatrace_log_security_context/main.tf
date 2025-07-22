resource "dynatrace_log_security_context" "this" {
  for_each = var.resources["log_security_context"]

  security_context_rule {
    query              = each.value.security_context_rule.query
    rule_name          = each.value.security_context_rule.rule_name
    value_source_field = each.value.security_context_rule.value_source_field
    value_source       = each.value.security_context_rule.value_source
  }
}
