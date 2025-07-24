output "audit_log_enabled" {
  value = [
    for r in var.audit_log_resources : r.settings.audit_log.enabled
  ]
}