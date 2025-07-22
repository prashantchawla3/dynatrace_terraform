output "security_contexts_enabled" {
  value = [for k, v in dynatrace_security_context.this : v.enabled]
}
