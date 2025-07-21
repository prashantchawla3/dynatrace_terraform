output "disk_analytics_ids" {
  description = "The IDs of the created disk analytics configurations."
  value       = dynatrace_disk_analytics.example[*].id
}
