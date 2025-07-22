output "full_web_service_ids" {
  value = [for fws in dynatrace_service_full_web_service.this : fws.id]
}
