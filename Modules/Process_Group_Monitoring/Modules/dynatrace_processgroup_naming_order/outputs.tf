output "pg_naming_ids" {
  value = [for k, v in dynatrace_processgroup_naming.this : v.id]
}
