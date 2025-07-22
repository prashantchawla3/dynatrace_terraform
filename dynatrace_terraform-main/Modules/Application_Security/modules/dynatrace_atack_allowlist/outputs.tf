output "attack_allowlist_names" {
  value = [for a in dynatrace_attack_allowlist.allowlist : a.rule_name]
}