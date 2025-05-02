output "container_builtin_rule_id" {
  description = "ID of the built-in container monitoring rule"
  value       = dynatrace_container_builtin_rule.container_rule.id
  condition   = var.builtin_rule_enabled
}

output "container_registry_id" {
  description = "ID of the container registry"
  value       = dynatrace_container_registry.container_registry.id
  condition   = var.registry_enabled
}

output "container_rule_id" {
  description = "ID of the container rule"
  value       = dynatrace_container_rule.container_monitoring_rule.id
  condition   = var.container_rule_enabled
}

output "container_technology_id" {
  description = "ID of the container technology config"
  value       = dynatrace_container_technology.container_technology.id
  condition   = var.technology_enabled
}
