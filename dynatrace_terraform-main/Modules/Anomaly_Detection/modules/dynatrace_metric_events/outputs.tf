output "metric_events_summary" {
  description = "Summary of the metric event"
  value       = dynatrace_metric_events.this.summary
}

output "metric_events_enabled" {
  description = "Whether the metric event is enabled"
  value       = dynatrace_metric_events.this.enabled
}