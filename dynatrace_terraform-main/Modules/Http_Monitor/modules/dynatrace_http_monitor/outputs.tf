output "http_monitor_ids" {
  value = [for m in dynatrace_http_monitor.monitor : m.id]
}