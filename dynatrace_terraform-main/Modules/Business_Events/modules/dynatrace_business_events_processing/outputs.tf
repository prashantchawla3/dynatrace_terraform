output "processing_rule_id" {
  description = "The ID of the Business Events processing rule"
  value       = dynatrace_business_events_processing.this.id
}

output "processing_rule_enabled" {
  description = "Whether the Business Events processing rule is enabled"
  value       = dynatrace_business_events_processing.this.enabled
}

output "processing_rule_name" {
  description = "The name of the Business Events processing rule"
  value       = dynatrace_business_events_processing.this.rule_name
}

output "processing_rule_matcher" {
  description = "The matcher used in the processing rule"
  value       = dynatrace_business_events_processing.this.matcher
}

output "processing_rule_script" {
  description = "The script used in the processing rule"
  value       = dynatrace_business_events_processing.this.script
}

output "processing_rule_sample_event" {
  description = "The sample event used for rule testing"
  value       = dynatrace_business_events_processing.this.rule_testing[0].sample_event
}

output "processing_transformation_fields" {
  description = "List of transformation fields defined in the processing rule"
  value = [
    for field in dynatrace_business_events_processing.this.transformation_fields[0].transformation_field : {
      name     = field.name
      type     = field.type
      array    = field.array
      optional = field.optional
      readonly = field.readonly
    }
  ]
}
