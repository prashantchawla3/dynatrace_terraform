output "browser_monitor_outage_ids" {
  description = "List of browser monitor outage resource IDs"
  value       = [for k in dynatrace_browser_monitor_outage.outage : k.id]
}

output "browser_monitor_outage_scopes" {
  description = "Mapped scopes used for browser monitor outage detection"
  value       = [for k in dynatrace_browser_monitor_outage.outage : k.scope]
}

output "browser_monitor_outage_retry_flags" {
  description = "Retry flags per monitor for error-triggered re-execution"
  value       = {
    for k, v in dynatrace_browser_monitor_outage.outage :
    k => v.retry_on_error
  }
}
