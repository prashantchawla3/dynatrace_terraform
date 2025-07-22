resource "dynatrace_calculated_mobile_metric" "this" {
  for_each = var.calculated_mobile_metrics

  name           = each.key
  enabled        = each.value.enabled
  app_identifier = each.value.app_identifier
  metric_key     = each.value.metric_key
  metric_type    = each.value.metric_type

  dimensions {
    dynamic "dimension" {
      for_each = each.value.dimensions
      content {
        dimension = dimension.value.dimension
        top_x     = dimension.value.top_x
      }
    }
  }
}
