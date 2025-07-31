output "oneagent_event_id" {
  description = "The ID of the OneAgent Business Events configuration"
  value       = dynatrace_business_events_oneagent.this.id
}

output "oneagent_event_enabled" {
  description = "Whether the OneAgent Business Events configuration is enabled"
  value       = dynatrace_business_events_oneagent.this.enabled
}

output "oneagent_event_rule_name" {
  description = "The rule name for the OneAgent Business Events configuration"
  value       = dynatrace_business_events_oneagent.this.rule_name
}

output "oneagent_event_scope" {
  description = "The scope of the OneAgent Business Events configuration"
  value       = dynatrace_business_events_oneagent.this.scope
}

output "oneagent_event_category_source_type" {
  description = "The source type for the event category"
  value       = dynatrace_business_events_oneagent.this.event[0].category[0].source_type
}

output "oneagent_event_provider_source" {
  description = "The source for the event provider"
  value       = dynatrace_business_events_oneagent.this.event[0].provider[0].source
}

output "oneagent_event_provider_source_type" {
  description = "The source type for the event provider"
  value       = dynatrace_business_events_oneagent.this.event[0].provider[0].source_type
}

output "oneagent_event_type_source" {
  description = "The source for the event type"
  value       = dynatrace_business_events_oneagent.this.event[0].type[0].source
}

output "oneagent_event_type_source_type" {
  description = "The source type for the event type"
  value       = dynatrace_business_events_oneagent.this.event[0].type[0].source_type
}

output "oneagent_event_trigger_type" {
  description = "The type of the trigger"
  value       = dynatrace_business_events_oneagent.this.triggers[0].trigger[0].type
}

output "oneagent_event_trigger_value" {
  description = "The value of the trigger"
  value       = dynatrace_business_events_oneagent.this.triggers[0].trigger[0].value
}

output "oneagent_event_trigger_data_source" {
  description = "The data source of the trigger"
  value       = dynatrace_business_events_oneagent.this.triggers[0].trigger[0].source[0].data_source
}
