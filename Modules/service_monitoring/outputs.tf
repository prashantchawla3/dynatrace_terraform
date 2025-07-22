output "api_detection_id" {
  value = dynatrace_api_detection.example.id
}

output "calculated_service_metric_id" {
  value = dynatrace_calculated_service_metric.example.id
}

output "key_requests_id" {
  value = dynatrace_key_requests.example.id
}

output "muted_requests_id" {
  value = dynatrace_muted_requests.example.id
}

output "request_attribute_id" {
  value = dynatrace_request_attribute.example.id
}

output "service_naming_id" {
  value = dynatrace_service_naming.example.id
}

output "url_based_sampling_id" {
  value = dynatrace_url_based_sampling.example.id
}

output "request_naming_rule_ids" {
  description = "IDs of request naming rules"
  value       = [for r in dynatrace_request_naming.request_naming : r.id]
}

output "request_namings_id" {
  description = "ID of the request namings resource"
  value       = dynatrace_request_namings.request_namings.id
}

output "service_naming_order_id" {
  description = "ID of the service naming order resource"
  value       = dynatrace_service_naming_order.service_naming_order.id
}
