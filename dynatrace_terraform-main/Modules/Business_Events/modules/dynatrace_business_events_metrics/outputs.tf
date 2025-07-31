output "business_events_metrics_id" {
  description = "The ID of the Business Events metrics configuration"
  value       = dynatrace_business_events_metrics.this.id
}

output "business_events_metrics_enabled" {
  description = "Whether the Business Events metrics are enabled"
  value       = dynatrace_business_events_metrics.this.enabled
}

output "business_events_metrics_key" {
  description = "The key used for the Business Events metric"
  value       = dynatrace_business_events_metrics.this.key
}

output "business_events_metrics_matcher" {
  description = "The matcher used for the Business Events metric"
  value       = dynatrace_business_events_metrics.this.matcher
}

output "business_events_metrics_measure" {
  description = "The measure type used for the Business Events metric"
  value       = dynatrace_business_events_metrics.this.measure
}

output "business_events_metrics_measure_attribute" {
  description = "The attribute used for measuring the Business Events metric"
  value       = dynatrace_business_events_metrics.this.measure_attribute
}
