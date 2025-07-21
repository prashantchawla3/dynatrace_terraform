resource "dynatrace_calculated_service_metric" "example" {
  name             = var.metric_name
  enabled          = var.metric_enabled
  management_zones = var.management_zones
  metric_key       = var.metric_key
  unit             = var.metric_unit

  dynamic "conditions" {
    for_each = [1]
    content {
      condition {
        attribute = var.condition_attribute
        comparison {
          negate = var.comparison_negate
          http_method {
            operator = var.http_method_operator
            values   = var.http_method_values
          }
        }
      }
    }
  }

  metric_definition {
    metric            = var.metric_definition_metric
    request_attribute = var.metric_definition_request_attribute
  }
}
