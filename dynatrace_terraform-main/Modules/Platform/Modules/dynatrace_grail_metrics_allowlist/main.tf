resource "dynatrace_grail_metrics_allowlist" "this" {
  for_each = var.grail_allowlist

  allow_rules {
    dynamic "allow_rule" {
      for_each = each.value.allow_rules
      content {
        enabled    = allow_rule.value.enabled
        metric_key = allow_rule.value.metric_key
        pattern    = allow_rule.value.pattern
      }
    }
  }
}