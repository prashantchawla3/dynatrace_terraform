resource "dynatrace_attack_settings" "settings" {
  count = length(var.attack_settings)

  enabled = var.attack_settings[count.index].enabled

  default_attack_handling {
    blocking_strategy_java = var.attack_settings[count.index].blocking_strategy_java
  }
}