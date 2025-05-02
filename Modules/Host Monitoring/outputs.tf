output "aix_extension_ids" {
  description = "The IDs of the created AIX extensions."
  value       = dynatrace_aix_extension.example[*].id
}

output "crashdump_analytics_ids" {
  description = "The IDs of the created crash dump analytics configurations."
  value       = dynatrace_crashdump_analytics.example[*].id
}

output "disk_analytics_ids" {
  description = "The IDs of the created disk analytics configurations."
  value       = dynatrace_disk_analytics.example[*].id
}

output "host_monitoring_ids" {
  description = "The IDs of the created host monitoring configurations."
  value       = dynatrace_host_monitoring.example[*].id
}

output "host_process_group_monitoring_ids" {
  description = "The IDs of the created host process group monitoring configurations."
  value       = dynatrace_host_process_group_monitoring.example[*].id
}
