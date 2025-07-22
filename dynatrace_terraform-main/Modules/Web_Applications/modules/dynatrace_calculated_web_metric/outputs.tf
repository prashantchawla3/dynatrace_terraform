output "dynatrace_calculated_web_metric_ids" {
  value = [for metric in dynatrace_calculated_web_metric.calculated_web_metric : metric.id]
}