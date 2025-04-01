output "management_zone_id" {
  description = "The ID of the created management zone"
  value       = dynatrace_management_zone_v2.example_zone.id
}

output "management_zone_name" {
  description = "The name of the created management zone"
  value       = dynatrace_management_zone_v2.example_zone.name
}