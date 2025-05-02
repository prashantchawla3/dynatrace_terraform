output "slo_id" {
  value       = dynatrace_slo_v2.example.id
  description = "The ID of the created SLO"
}

output "slo_name" {
  value       = dynatrace_slo_v2.example.name
  description = "The name of the created SLO"
}
