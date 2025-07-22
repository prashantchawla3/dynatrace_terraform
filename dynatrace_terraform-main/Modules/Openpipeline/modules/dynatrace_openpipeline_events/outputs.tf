output "events_id" {
  value = var.enable_events ? dynatrace_openpipeline_events.this[0].id : null
}
