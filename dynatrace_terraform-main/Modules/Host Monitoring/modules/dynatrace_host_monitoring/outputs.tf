output "host_monitoring_ids" {
  description = "The IDs of the created host monitoring configurations."
  value       = dynatrace_host_monitoring.example[*].id
}
