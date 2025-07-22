resource "dynatrace_request_naming" "request_naming" {
  for_each       = var.request_naming_rules
  naming_pattern = each.value.naming_pattern
  enabled        = each.value.enabled
  management_zones = each.value.management_zones

  dynamic "conditions" {
    for_each = each.value.conditions
    content {
      dynamic "condition" {
        for_each = conditions.value.condition
        content {
          attribute = condition.value.attribute

          dynamic "comparison" {
            for_each = condition.value.comparison != null ? [condition.value.comparison] : []
            content {
              fast_string {
                value    = comparison.value.fast_string.value
                operator = comparison.value.fast_string.operator
              }
            }
          }
        }
      }
    }
  }

  dynamic "placeholders" {
    for_each = each.value.placeholders != null ? [each.value.placeholders] : []
    content {
      dynamic "placeholder" {
        for_each = placeholders.value.placeholder
        content {
          name      = placeholder.value.name
          kind      = placeholder.value.kind
          attribute = placeholder.value.attribute
        }
      }
    }
  }
}