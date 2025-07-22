output "service_http_failure_id" {
  value = var.service_http_failure_enabled ? dynatrace_service_http_failure.this[0].id : null
}
