
output "slo_id" {
  description = "The ID of the created SLO"
  value       = dynatrace_slo_v2.example_slo.id
}

output "slo_name" {
  description = "The name of the created SLO"
  value       = dynatrace_slo_v2.example_slo.name
}