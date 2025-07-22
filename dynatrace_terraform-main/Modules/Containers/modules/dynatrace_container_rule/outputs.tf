output "container_rule_id" {
  value       = var.container_rule_enabled ? dynatrace_container_rule.this[0].id : null
  description = "ID of the Dynatrace container rule"
}
