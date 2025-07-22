resource "dynatrace_calculated_web_metric" "calculated_web_metric" {
  count          = length(var.calculated_web_metrics)
  app_identifier = var.calculated_web_metrics[count.index].app_identifier
  enabled        = var.calculated_web_metrics[count.index].enabled
  metric_key     = var.calculated_web_metrics[count.index].metric_key
  name           = var.calculated_web_metrics[count.index].name

  dynamic "dimensions" {
    for_each = var.calculated_web_metrics[count.index].dimensions != null ? [var.calculated_web_metrics[count.index].dimensions] : []
    content {
      dimension {
        dimension    = dimensions.value.dimension
        property_key = dimensions.value.property_key
        top_x        = dimensions.value.top_x
      }
    }
  }

  dynamic "metric_definition" {
    for_each = var.calculated_web_metrics[count.index].metric_definition != null ? [var.calculated_web_metrics[count.index].metric_definition] : []
    content {
      metric       = metric_definition.value.metric
      property_key = metric_definition.value.property_key
    }
  }

  dynamic "user_action_filter" {
    for_each = var.calculated_web_metrics[count.index].user_action_filter != null ? [var.calculated_web_metrics[count.index].user_action_filter] : []
    content {
      continent                         = user_action_filter.value.continent
      target_view_group_name_match_type = user_action_filter.value.target_view_group_name_match_type
      target_view_name_match_type       = user_action_filter.value.target_view_name_match_type
    }
  }
}
