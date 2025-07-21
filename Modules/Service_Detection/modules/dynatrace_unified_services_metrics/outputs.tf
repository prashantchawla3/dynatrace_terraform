output "unified_services_metrics_ids" {
  value = [for usm in dynatrace_unified_services_metrics.this : usm.id]
}