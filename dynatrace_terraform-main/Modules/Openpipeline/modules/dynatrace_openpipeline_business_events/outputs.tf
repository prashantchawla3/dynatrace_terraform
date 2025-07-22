output "business_events_id" {
  value = var.enable_business_events ? dynatrace_openpipeline_business_events.this[0].id : null
}
