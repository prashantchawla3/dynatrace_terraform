output "security_context_rule_name" {
  description = "The name of the security context rule"
  value       = dynatrace_business_events_security_context.this.security_context_rule[0].rule_name
}

output "security_context_query" {
  description = "The query used in the security context rule"
  value       = dynatrace_business_events_security_context.this.security_context_rule[0].query
}

output "security_context_value_source" {
  description = "The value source used in the security context rule"
  value       = dynatrace_business_events_security_context.this.security_context_rule[0].value_source
}

output "security_context_value_source_field" {
  description = "The value source field used in the security context rule"
  value       = dynatrace_business_events_security_context.this.security_context_rule[0].value_source_field
}
