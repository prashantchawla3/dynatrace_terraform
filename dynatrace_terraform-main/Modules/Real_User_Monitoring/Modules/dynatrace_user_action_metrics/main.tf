resource "dynatrace_user_action_metrics" "this" {
  for_each = var.user_action_metrics
  enabled     = each.value.enabled
  dimensions  = each.value.dimensions
  metric_key  = each.value.metric_key

  dynamic "filters" {
    for_each = each.value.filters
    content {
      dynamic "filter" {
        for_each = filters.value.filter
        content {
          field_name = filter.value.field_name
          operator   = filter.value.operator
          value      = filter.value.value
        }
      }
    }
  }

  value {
    type = each.value.value.type
  }
}