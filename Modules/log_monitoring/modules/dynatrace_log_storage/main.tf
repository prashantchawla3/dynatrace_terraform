resource "dynatrace_log_storage" "this" {
  for_each = var.resources["log_storage"]

  name            = each.value.name
  enabled         = each.value.enabled
  scope           = each.value.scope
  send_to_storage = each.value.send_to_storage

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
