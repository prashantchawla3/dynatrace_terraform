output "browser_monitor_names" {
  description = "Names of all browser monitors"
  value       = [for bm in dynatrace_browser_monitor.monitor : bm.name]
}