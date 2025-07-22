output "pg_detection_ids" {
  value = [for k, v in dynatrace_process_group_detection.this : v.id]
}
