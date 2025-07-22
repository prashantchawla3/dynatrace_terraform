output "cookie_monitor_ids" {
  value = [for c in dynatrace_http_monitor_cookies.cookie : c.id]
}

output "outage_monitor_id" {
  value = var.enable_outage_monitoring ? dynatrace_http_monitor_outage.outage[0].id : null
}

output "performance_monitor_ids" {
  value = [for p in dynatrace_http_monitor_performance.performance : p.id]
}

output "script_monitor_ids" {
  value = [for s in dynatrace_http_monitor_script.script : s.id]
}

output "http_monitor_ids" {
  value = [for m in dynatrace_http_monitor.monitor : m.id]
}
