resource "dynatrace_alerting" "this" {
  name             = var.alerting_name
  management_zone  = var.management_zone

  rules {
    dynamic "rule" {
      for_each = var.rules
      content {
        include_mode     = rule.value.include_mode
        tags             = rule.value.tags
        delay_in_minutes = rule.value.delay_in_minutes
        severity_level   = rule.value.severity_level
      }
    }
  }
}