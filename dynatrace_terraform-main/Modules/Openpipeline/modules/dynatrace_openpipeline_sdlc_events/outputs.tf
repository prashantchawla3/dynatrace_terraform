output "sdlc_events_id" {
  value = var.enable_sdlc_events ? dynatrace_openpipeline_sdlc_events.this[0].id : null
}
