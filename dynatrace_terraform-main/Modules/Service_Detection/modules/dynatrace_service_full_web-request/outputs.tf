output "full_web_request_ids" {
  value = [for fwr in dynatrace_service_full_web_request.this : fwr.id]
}