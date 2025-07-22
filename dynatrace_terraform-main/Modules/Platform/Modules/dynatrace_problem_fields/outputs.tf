output "problem_field_statuses" {
  value = [for k, v in dynatrace_problem_fields.this : v.enabled]
}
