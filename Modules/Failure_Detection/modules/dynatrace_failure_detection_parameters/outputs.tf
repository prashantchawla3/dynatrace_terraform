output "failure_detection_parameters_id" {
  value = var.failure_detection_parameters_enabled ? dynatrace_failure_detection_parameters.this[0].id : null
}
