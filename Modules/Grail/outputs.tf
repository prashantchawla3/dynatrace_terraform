output "segment_ids" {
  description = "The IDs of the created Dynatrace segments."
  value       = dynatrace_segment.example[*].id
}

output "segment_names" {
  description = "The names of the created Dynatrace segments."
  value       = dynatrace_segment.example[*].name
}
