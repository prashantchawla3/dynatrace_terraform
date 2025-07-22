output "calculated_mobile_metric_ids" {
  value = { for k, v in dynatrace_calculated_mobile_metric.this : k => v.id }
}
