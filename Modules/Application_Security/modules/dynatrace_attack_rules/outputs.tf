output "attack_rule_comments" {
  value = [for r in dynatrace_attack_rules.rules : r.metadata[0].comment]
}