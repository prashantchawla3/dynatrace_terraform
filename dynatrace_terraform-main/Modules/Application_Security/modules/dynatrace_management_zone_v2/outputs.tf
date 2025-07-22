output "management_zone_names" {
  value = [for m in dynatrace_management_zone_v2.mgmz : m.name]
}
