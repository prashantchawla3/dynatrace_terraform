output "service_splitting_rule_ids" {
  value = [for k, v in dynatrace_service_splitting.this : v.id]
}