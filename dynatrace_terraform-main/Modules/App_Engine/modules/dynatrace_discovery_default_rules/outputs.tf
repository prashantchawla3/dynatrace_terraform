output "discovery_default_rule_ids" {
  description = "List of IDs for the created discovery default rules"
  value       = dynatrace_discovery_default_rules.default_rules[*].id
}