output "script_monitor_ids" {
  value = [for s in dynatrace_http_monitor_script.script : s.id]
}
