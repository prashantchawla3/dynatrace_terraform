resource "dynatrace_autotag_v2" "example" {
  name                         = var.autotag_name
  rules_maintained_externally = true

  dynamic "rules" {
    for_each = var.autotag_rules
    content {
      rule {
        type                = rules.value.type
        enabled             = rules.value.enabled
        value_format        = rules.value.value_format
        value_normalization = rules.value.value_normalization

        attribute_rule {
          entity_type                  = rules.value.entity_type
          service_to_host_propagation = rules.value.service_to_host_propagation
          service_to_pgpropagation    = rules.value.service_to_pgpropagation

          dynamic "conditions" {
            for_each = rules.value.conditions
            content {
              condition {
                dynamic_key        = conditions.value.dynamic_key
                dynamic_key_source = conditions.value.dynamic_key_source
                key                = conditions.value.key
                operator           = conditions.value.operator
                tag                = lookup(conditions.value, "tag", null)
              }
            }
          }
        }
      }
    }
  }
}

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

  dynamic "tags" {
    for_each = var.custom_tags
    content {
      filter {
        context = tags.value.context
        key     = tags.value.key
        value   = lookup(tags.value, "value", null)
      }
    }
  }
}
