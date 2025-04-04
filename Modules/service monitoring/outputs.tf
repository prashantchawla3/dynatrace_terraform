output "calculated_service_metric_id" {
  value = data.dynatrace_calculated_service_metric.example.id
}

output "request_attribute_id" {
  value = data.dynatrace_request_attribute.example.id
}

output "request_naming_id" {
  value = data.dynatrace_request_naming.example.id
}