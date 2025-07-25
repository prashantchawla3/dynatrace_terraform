output "browser_monitor_performance_ids" {
  description = "List of Dynatrace browser monitor performance resource IDs"
  value       = [for k in dynatrace_browser_monitor_performance.performance : k.id]
}

output "browser_monitor_performance_scopes" {
  description = "Resolved scopes for browser monitor performance tracking"
  value       = [for k in dynatrace_browser_monitor_performance.performance : k.scope]
}

output "browser_monitor_performance_thresholds" {
  description = "Performance thresholds mapped by monitor"
  value = {
    for k, v in dynatrace_browser_monitor_performance.performance :
    k => {
      event     = v.thresholds[0].event
      threshold = v.thresholds[0].threshold
    }
  }
}
