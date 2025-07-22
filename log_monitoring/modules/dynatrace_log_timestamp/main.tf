resource "dynatrace_log_timestamp" "this" {
  for_each = var.resources["log_timestamp"]

  enabled           = each.value.enabled
  config_item_title = each.value.config_item_title
  date_time_pattern = each.value.date_time_pattern
  scope             = each.value.scope
  timezone          = each.value.timezone

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
