
resource "dynatrace_autotag_rules" "example" {
  auto_tag_id = dynatrace_autotag_v2.example.id

  dynamic "rules" {
    for_each = var.autotag_selector_rules
    content {
      rule {
        type                = rules.value.type
        enabled             = rules.value.enabled
        entity_selector     = rules.value.entity_selector
        value_format        = rules.value.value_format
        value_normalization = rules.value.value_normalization
      }
    }
  }
}

resource "dynatrace_custom_tags" "example" {
  entity_selector = var.entity_selector

  tags {
    dynamic "filter" {
      for_each = var.custom_tags
      content {
        context = filter.value.context
        key     = filter.value.key
        value   = lookup(filter.value, "value", null)
      }
    }
  }
}
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




