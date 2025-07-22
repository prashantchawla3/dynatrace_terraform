output "service_failure_id" {
  value = var.service_failure_enabled ? dynatrace_service_failure.this[0].id : null
}
