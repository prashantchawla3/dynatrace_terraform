output "custom_service_ids" {
  value = [for cs in dynatrace_custom_service.this : cs.id]
}