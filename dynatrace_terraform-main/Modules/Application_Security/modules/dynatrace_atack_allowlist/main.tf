resource "dynatrace_attack_allowlist" "allowlist" {
  count = length(var.attack_allowlists)

  enabled      = var.attack_allowlists[count.index].enabled
  insert_after = var.attack_allowlists[count.index].insert_after
  rule_name    = var.attack_allowlists[count.index].rule_name

  attack_handling {
    blocking_strategy = var.attack_allowlists[count.index].blocking_strategy
  }

  metadata {
    comment = var.attack_allowlists[count.index].comment
  }

  dynamic "resource_attribute_conditions" {
    for_each = [1]
    content {
      dynamic "resource_attribute_condition" {
        for_each = var.attack_allowlists[count.index].conditions
        content {
          matcher                  = resource_attribute_condition.value.matcher
          resource_attribute_key   = resource_attribute_condition.value.key
          resource_attribute_value = resource_attribute_condition.value.value
        }
      }
    }
  }

  dynamic "rules" {
    for_each = [1]
    content {
      dynamic "rule" {
        for_each = var.attack_allowlists[count.index].rules
        content {
          criteria_key     = rule.value.key
          criteria_matcher = rule.value.matcher

          # Only include criteria_value_detection if the key is not ACTOR_IP
          criteria_value_free_text = rule.value.value


        }
      }
    }
  }
}
