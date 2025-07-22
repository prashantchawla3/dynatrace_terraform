output "request_naming_rule_ids" {
  description = "IDs of request naming rules"
  value       = [for r in dynatrace_request_naming.request_naming : r.id]
}
