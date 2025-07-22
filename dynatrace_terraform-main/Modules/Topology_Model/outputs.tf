
output "generic_relationships_id" {
  description = "The ID of the generic relationships resource"
  value       = dynatrace_generic_relationships.example.id
}

output "generic_types_id" {
  description = "The ID of the generic types resource"
  value       = dynatrace_generic_types.example.id
}

output "grail_security_context_id" {
  description = "The ID of the Grail security context resource"
  value       = dynatrace_grail_security_context.example.id
}
