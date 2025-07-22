resource "dynatrace_service_splitting" "this" {
  for_each = var.service_splitting_rules

  enabled = each.value.enabled
  scope   = each.value.scope

  dynamic "rule" {
    for_each = each.value.rules
    content {
      description   = rule.value.description
      condition     = rule.value.condition
      rule_name     = rule.value.rule_name

      dynamic "service_splitting_attributes" {
        for_each = [rule.value.service_splitting_attributes]
        content {
          dynamic "service_splitting_attribute" {
            for_each = service_splitting_attributes.value
            content {
              key = service_splitting_attribute.value.key
            }
          }
        }
      }
    }
  }
}
