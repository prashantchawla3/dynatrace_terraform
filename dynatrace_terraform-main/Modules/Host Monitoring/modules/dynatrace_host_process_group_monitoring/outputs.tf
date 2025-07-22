output "host_process_group_monitoring_ids" {
  description = "The IDs of the created host process group monitoring configurations."
  value       = dynatrace_host_process_group_monitoring.example[*].id
}
