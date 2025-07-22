output "pg_monitoring_ids" {
  value = [for k, v in dynatrace_process_group_monitoring.this : v.id]
}
