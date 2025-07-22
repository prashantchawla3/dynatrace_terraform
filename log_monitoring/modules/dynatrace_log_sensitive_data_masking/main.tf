resource "dynatrace_log_sensitive_data_masking" "this" {
  for_each = var.resources["log_sensitive_data_masking"]

  name    = each.value.name
  enabled = each.value.enabled
  scope   = each.value.scope

  dynamic "masking" {
    for_each = each.value.masking
    content {
      type       = masking.value.type
      expression = masking.value.expression
    }
  }

  dynamic "matchers" {
    for_each = each.value.matchers
    content {
      dynamic "matcher" {
        for_each = matchers.value.matcher
        content {
          attribute = matcher.value.attribute
          operator  = matcher.value.operator
          values    = matcher.value.values
        }
      }
    }
  }
}
