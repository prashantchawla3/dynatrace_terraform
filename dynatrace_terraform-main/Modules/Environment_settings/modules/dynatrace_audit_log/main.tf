resource "dynatrace_audit_log" "this" {
  for_each = {
    for r in var.audit_log_resources : r.name => r
    if r.settings.audit_log != null
  }

  enabled = each.value.settings.audit_log.enabled
}
