output "external_web_service_ids" {
  value = [for k, v in dynatrace_service_external_web_service.this : v.id]
}
