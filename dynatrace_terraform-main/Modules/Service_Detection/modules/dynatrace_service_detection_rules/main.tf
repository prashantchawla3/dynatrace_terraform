resource "dynatrace_service_detection_rules" "this" {
  for_each = var.service_detection_rules

  enabled = each.value.enabled
  scope   = each.value.scope

  dynamic "rule" {
    for_each = each.value.rules
    content {
      description                   = rule.value.description
      additional_required_attributes = rule.value.additional_required_attributes
      condition                     = rule.value.condition
      rule_name                     = rule.value.rule_name
      service_name_template         = rule.value.service_name_template
    }
  }
}