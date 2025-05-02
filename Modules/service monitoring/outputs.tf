output "calculated_service_metric_id" {
  value       = dynatrace_calculated_service_metric.example.id
  description = "ID of calculated service metric"
}

output "request_attribute_id" {
  value       = dynatrace_request_attribute.example.id
  description = "ID of request attribute"
}

output "request_naming_id" {
  value       = dynatrace_service_naming.example.id
  description = "ID of service naming pattern"
}
