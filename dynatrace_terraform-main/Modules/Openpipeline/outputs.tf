output "business_events_id" {
  value = var.enable_business_events ? dynatrace_openpipeline_business_events.this[0].id : null
}

output "events_id" {
  value = var.enable_events ? dynatrace_openpipeline_events.this[0].id : null
}

output "logs_id" {
  value = var.enable_logs ? dynatrace_openpipeline_logs.this[0].id : null
}

output "security_events_id" {
  value = var.enable_security_events ? dynatrace_openpipeline_security_events.this[0].id : null
}

output "sdlc_events_id" {
  value = var.enable_sdlc_events ? dynatrace_openpipeline_sdlc_events.this[0].id : null
}
