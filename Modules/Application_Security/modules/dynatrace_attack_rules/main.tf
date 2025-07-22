resource "dynatrace_attack_rules" "rules" {
  count = length(var.attack_rules)

  criteria {
    attack_type = var.attack_rules[count.index].attack_type
  }

  enabled = var.attack_rules[count.index].enabled

  metadata {
    comment = var.attack_rules[count.index].comment
  }

  attack_handling {
    blocking_strategy = var.attack_rules[count.index].blocking_strategy
  }
}
