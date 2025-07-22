output "performance_monitor_ids" {
  value = [for p in dynatrace_http_monitor_performance.performance : p.id]
}
