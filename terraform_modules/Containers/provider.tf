output "container_rule_id" {
  description = "The ID of the container built-in rule"
  value       = dynatrace_container_builtin_rule.container_rule.id
}

output "container_registry_id" {
  description = "The ID of the container registry"
  value       = dynatrace_container_registry.container_registry.id
}

output "container_monitoring_rule_id" {
  description = "The ID of the container monitoring rule"
  value       = dynatrace_container_rule.container_monitoring_rule.id
}

output "container_technology_id" {
  description = "The ID of the container technology"
  value       = dynatrace_container_technology.container_technology.id
}