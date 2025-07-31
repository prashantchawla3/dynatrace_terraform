output "oneagent_outgoing_event_id" {
  description = "The ID of the OneAgent Outgoing Business Events configuration"
  value       = dynatrace_business_events_oneagent_outgoing.this.id
}

output "oneagent_outgoing_event_enabled" {
  description = "Whether the OneAgent Outgoing Business Events configuration is enabled"
  value       = dynatrace_business_events_oneagent_outgoing.this.enabled
}

output "oneagent_outgoing_event_rule_name" {
  description = "The rule name for the OneAgent Outgoing Business Events configuration"
  value       = dynatrace_business_events_oneagent_outgoing.this.rule_name
}

output "oneagent_outgoing_event_scope" {
  description = "The scope of the OneAgent Outgoing Business Events configuration"
  value       = dynatrace_business_events_oneagent_outgoing.this.scope
}

output "oneagent_outgoing_event_category_source" {
  description = "The source for the event category"
  value       = dynatrace_business_events_oneagent_outgoing.this.event[0].category[0].source
}

output "oneagent_outgoing_event_category_source_type" {
  description = "The source type for the event category"
  value       = dynatrace_business_events_oneagent_outgoing.this.event[0].category[0].source_type
}

output "oneagent_outgoing_event_field_name" {
  description = "The name of the outgoing event data field"
  value       = dynatrace_business_events_oneagent_outgoing.this.event[0].data[0].event_data_field_complex[0].name
}

output "oneagent_outgoing_event_field_path" {
  description = "The path of the outgoing event data field"
  value       = dynatrace_business_events_oneagent_outgoing.this.event[0].data[0].event_data_field_complex[0].source[0].path
}

output "oneagent_outgoing_event_field_source_type" {
  description = "The source type of the outgoing event data field"
  value       = dynatrace_business_events_oneagent_outgoing.this.event[0].data[0].event_data_field_complex[0].source[0].source_type
}

output "oneagent_outgoing_event_provider_source" {
  description = "The source for the event provider"
  value       = dynatrace_business_events_oneagent_outgoing.this.event[0].provider[0].source
}

output "oneagent_outgoing_event_provider_source_type" {
  description = "The source type for the event provider"
  value       = dynatrace_business_events_oneagent_outgoing.this.event[0].provider[0].source_type
}

output "oneagent_outgoing_event_type_source" {
  description = "The source for the event type"
  value       = dynatrace_business_events_oneagent_outgoing.this.event[0].type[0].source
}

output "oneagent_outgoing_event_type_source_type" {
  description = "The source type for the event type"
  value       = dynatrace_business_events_oneagent_outgoing.this.event[0].type[0].source_type
}

output "oneagent_outgoing_trigger_type" {
  description = "The type of the trigger"
  value       = dynatrace_business_events_oneagent_outgoing.this.triggers[0].trigger[0].type
}

output "oneagent_outgoing_trigger_value" {
  description = "The value of the trigger"
  value       = dynatrace_business_events_oneagent_outgoing.this.triggers[0].trigger[0].value
}

output "oneagent_outgoing_trigger_data_source" {
  description = "The data source of the trigger"
  value       = dynatrace_business_events_oneagent_outgoing.this.triggers[0].trigger[0].source[0].data_source
}
