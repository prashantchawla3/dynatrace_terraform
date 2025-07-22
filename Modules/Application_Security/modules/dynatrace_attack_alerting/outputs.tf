output "attack_alerting_names" {
  value = [for a in dynatrace_attack_alerting.alerting : a.name]
}
