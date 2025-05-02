output "browser_monitor_ids" {
  description = "Map of browser monitor names to their Dynatrace IDs"
  value       = { for m in dynatrace_browser_monitor.monitor : m.key => m.value.id }
}

output "browser_monitor_outage_ids" {
  description = "Map of browser monitor names to their outage config IDs (if created)"
  value       = { for o in dynatrace_browser_monitor_outage.outage : o.key => o.value.id }
}

output "browser_monitor_performance_ids" {
  description = "Map of browser monitor names to their performance config IDs (if created)"
  value       = { for p in dynatrace_browser_monitor_performance.performance : p.key => p.value.id }
}
