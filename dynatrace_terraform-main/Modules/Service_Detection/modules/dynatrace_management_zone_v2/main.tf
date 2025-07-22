resource "dynatrace_management_zone_v2" "this" {
  count = length(var.management_zones)

  name = var.management_zones[count.index].name

  dynamic "rules" {
    for_each = var.management_zones[count.index].rules
    content {
      rule {
        type            = rules.value.type
        enabled         = rules.value.enabled
        entity_selector = rules.value.entity_selector

        attribute_rule {
          entity_type = rules.value.entity_type

          attribute_conditions {
            condition {
              case_sensitive = rules.value.condition.case_sensitive
              key            = rules.value.condition.key
              operator       = rules.value.condition.operator
              string_value   = rules.value.condition.string_value
            }
          }
        }
      }
    }
  }
}
