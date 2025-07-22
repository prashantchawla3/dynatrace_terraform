output "external_web_request_ids" {
  value = [for ewr in dynatrace_service_external_web_request.this : ewr.id]
}
