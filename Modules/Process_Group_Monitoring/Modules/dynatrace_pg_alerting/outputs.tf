output "pg_alerting_ids" {
  value = [for k, v in dynatrace_pg_alerting.this : v.id]
}