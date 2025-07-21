resource "dynatrace_declarative_grouping" "this" {
  for_each = var.declarative_groupings

  name    = each.key
  enabled = each.value.enabled
  scope   = each.value.scope

  detection {
    process_definition {
      id                 = each.value.id
      process_group_name = each.value.process_group_name
      report             = each.value.report

      rules {
        dynamic "rule" {
          for_each = each.value.rules
          content {
            condition = rule.value.condition
            property  = rule.value.property
          }
        }
      }
    }
  }
}