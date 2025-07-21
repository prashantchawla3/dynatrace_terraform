resource "dynatrace_security_context" "this" {
  for_each = var.security_contexts

  enabled = each.value.enabled
}
