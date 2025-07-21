resource "dynatrace_span_capture_rule" "this" {
  for_each = var.span_capture_rules

  name   = each.key
  action = each.value.action

  matches {
    dynamic "match" {
      for_each = each.value.matches
      content {
        comparison = match.value.comparison
        source     = match.value.source
        value      = match.value.value
      }
    }
  }
}
