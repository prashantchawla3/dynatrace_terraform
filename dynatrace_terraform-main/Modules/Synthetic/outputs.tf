output "calculated_synthetic_metric_id" {
  value = dynatrace_calculated_synthetic_metric.example[0].id
}

output "synthetic_availability_id" {
  value = dynatrace_synthetic_availability.example[0].id
}

output "synthetic_location_id" {
  value = dynatrace_synthetic_location.example[0].id
}
