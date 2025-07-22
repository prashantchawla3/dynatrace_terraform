resource "dynatrace_attack_alerting" "alerting" {
  count                      = length(var.attack_alerting_names)
  name                       = var.attack_alerting_names[count.index]
  enabled                    = var.attack_alerting_enabled
  enabled_attack_mitigations = var.enabled_attack_mitigations
}