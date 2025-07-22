output "crashdump_analytics_ids" {
  description = "The IDs of the created crash dump analytics configurations."
  value       = dynatrace_crashdump_analytics.example[*].id
}