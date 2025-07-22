output "default_rule_ids" {
  value = [for r in dynatrace_discovery_default_rules.default_rules : r.id]
}
