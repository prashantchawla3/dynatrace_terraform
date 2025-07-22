output "security_events_id" {
  value = var.enable_security_events ? dynatrace_openpipeline_security_events.this[0].id : null
}
