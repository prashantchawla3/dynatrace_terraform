resource "dynatrace_autotag_v2" "example" {
  name                         = var.autotag_name
  rules_maintained_externally = false

  rules {
    dynamic "rule" {
      for_each = var.autotag_rules
      content {
        type                = rule.value.type
        enabled             = rule.value.enabled
        value_format        = rule.value.value_format
        value_normalization = rule.value.value_normalization

        attribute_rule {
          entity_type                  = rule.value.entity_type
          service_to_host_propagation = rule.value.service_to_host_propagation
          service_to_pgpropagation    = rule.value.service_to_pgpropagation

          conditions {
            dynamic "condition" {
              for_each = rule.value.conditions
              content {
                dynamic_key        = condition.value.dynamic_key
                dynamic_key_source = condition.value.dynamic_key_source
                key                = condition.value.key
                operator           = condition.value.operator
                tag                = lookup(condition.value, "tag", null)
              }
            }
          }
        }
      }
    }
  }
}
