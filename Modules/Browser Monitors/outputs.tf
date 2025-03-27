output "browser_monitor_id" {
  description = "The ID of the browser monitor resource"
  value       = dynatrace_browser_monitor.example.id
}

output "browser_monitor_outage_id" {
  description = "The ID of the browser monitor outage resource"
  value       = dynatrace_browser_monitor_outage.example.id
}

output "browser_monitor_performance_id" {
  description = "The ID of the browser monitor performance resource"
  value       = dynatrace_browser_monitor_performance.example.id
}