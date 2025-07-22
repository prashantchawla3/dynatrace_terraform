output "management_zone_ids" {
  value = [for mz in dynatrace_management_zone_v2.this : mz.id]
}