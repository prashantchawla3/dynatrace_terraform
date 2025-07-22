output "unified_services_opentel_ids" {
  value = [for uso in dynatrace_unified_services_opentel.this : uso.id]
}
