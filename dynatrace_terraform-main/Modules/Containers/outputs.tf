output "builtin_rule_id" {
  value       = var.builtin_rule_enabled ? dynatrace_container_builtin_rule.this[0].id : null
  description = "ID of the Dynatrace built-in container rule"
}

output "container_rule_id" {
  value       = var.container_rule_enabled ? dynatrace_container_rule.this[0].id : null
  description = "ID of the Dynatrace container rule"
}

output "container_technology_scope" {
  value       = var.technology_enabled ? dynatrace_container_technology.this[0].scope : null
  description = "Scope used in Dynatrace container technology configuration"
}
