output "host_monitoring_mode_ids" {
  description = "List of IDs for each host monitoring mode configuration"
  value = [
    for instance in dynatrace_host_monitoring_mode.example : instance.id
  ]
}

output "host_monitoring_mode_host_ids" {
  description = "List of host IDs for which monitoring modes are configured"
  value = [
    for instance in dynatrace_host_monitoring_mode.example : instance.host_id
  ]
}

output "host_monitoring_modes" {
  description = "List of monitoring modes applied to each host"
  value = [
    for instance in dynatrace_host_monitoring_mode.example : instance.monitoring_mode
  ]
}
