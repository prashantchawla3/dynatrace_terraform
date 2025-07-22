output "container_technology_scope" {
  value       = var.technology_enabled ? dynatrace_container_technology.this[0].scope : null
  description = "Scope used in Dynatrace container technology configuration"
}
