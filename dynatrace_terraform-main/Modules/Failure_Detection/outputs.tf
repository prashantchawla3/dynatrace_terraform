output "failure_detection_parameters_id" {
  value = var.failure_detection_parameters_enabled ? dynatrace_failure_detection_parameters.this[0].id : null
}

output "failure_detection_rules_id" {
  value = var.failure_detection_rules_enabled ? dynatrace_failure_detection_rules.this[0].id : null
}

output "service_failure_id" {
  value = var.service_failure_enabled ? dynatrace_service_failure.this[0].id : null
}

output "service_http_failure_id" {
  value = var.service_http_failure_enabled ? dynatrace_service_http_failure.this[0].id : null
}

output "example_failure_detection_parameters_id" {
  value = data.dynatrace_failure_detection_parameters.example.id
}
