output "network_monitor_ids" {
  value = { for k, v in dynatrace_network_monitor.this : k => v.id }
}

output "network_monitor_names" {
  value = { for k, v in dynatrace_network_monitor.this : k => v.name }
}
