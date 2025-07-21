resource "dynatrace_audit_log" "this" {
  for_each = {
    for r in var.resources : r.name => r
    if r.type == "audit_log" && r.settings.audit_log != null
  }

  enabled = each.value.settings.audit_log.enabled
}
