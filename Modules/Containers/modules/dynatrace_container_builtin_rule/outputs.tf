output "builtin_rule_id" {
  value       = var.builtin_rule_enabled ? dynatrace_container_builtin_rule.this[0].id : null
  description = "ID of the Dynatrace built-in container rule"
}
