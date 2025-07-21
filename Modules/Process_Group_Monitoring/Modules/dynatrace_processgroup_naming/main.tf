
resource "dynatrace_processgroup_naming" "this" {
  for_each = var.pg_namings

  name    = each.key
  enabled = each.value.enabled
  format  = each.value.format

  conditions {
    dynamic "condition" {
      for_each = each.value.conditions
      content {
        key {
          type      = condition.value.key_type
          attribute = condition.value.key_attribute
        }
        tech {
          negate   = condition.value.tech_negate
          operator = condition.value.tech_operator
          value {
            type = condition.value.tech_value_type
          }
        }
      }
    }

    dynamic "condition" {
      for_each = each.value.string_conditions
      content {
        process_metadata {
          attribute   = condition.value.attribute
          dynamic_key = condition.value.dynamic_key
        }
        string {
          case_sensitive = condition.value.case_sensitive
          negate         = condition.value.negate
          operator       = condition.value.operator
          value          = condition.value.value
        }
      }
    }
  }
}
