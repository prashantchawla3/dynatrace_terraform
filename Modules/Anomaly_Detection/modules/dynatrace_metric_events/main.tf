resource "dynatrace_metric_events" "this" {
  enabled                    = var.metric_events.enabled
  event_entity_dimension_key = var.metric_events.event_entity_dimension_key
  summary                    = var.metric_events.summary

  event_template {
    description = var.metric_events.event_template.description
    davis_merge = var.metric_events.event_template.davis_merge
    event_type  = var.metric_events.event_template.event_type
    title       = var.metric_events.event_template.title
  }

  model_properties {
    type               = var.metric_events.model_properties.type
    alert_condition    = var.metric_events.model_properties.alert_condition
    alert_on_no_data   = var.metric_events.model_properties.alert_on_no_data
    dealerting_samples = var.metric_events.model_properties.dealerting_samples
    samples            = var.metric_events.model_properties.samples
    threshold          = var.metric_events.model_properties.threshold
    violating_samples  = var.metric_events.model_properties.violating_samples
  }

  query_definition {
    type        = var.metric_events.query_definition.type
    aggregation = var.metric_events.query_definition.aggregation
    metric_key  = var.metric_events.query_definition.metric_key

    dimension_filter {
      dynamic "filter" {
        for_each = var.metric_events.query_definition.dimension_filter
        content {
          dimension_key   = filter.value.dimension_key
          dimension_value = filter.value.dimension_value
        }
      }
    }

    entity_filter {
      dimension_key = var.metric_events.query_definition.entity_filter.dimension_key

      conditions {
        dynamic "condition" {
          for_each = var.metric_events.query_definition.entity_filter.conditions
          content {
            type     = condition.value.type
            operator = condition.value.operator
            value    = condition.value.value
          }
        }
      }
    }
  }
}