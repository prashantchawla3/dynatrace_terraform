resource "dynatrace_network_monitor" "this" {
  for_each = var.network_monitors

  name        = each.value.name
  description = each.value.description
  type        = each.value.type
  enabled     = each.value.enabled
  frequency_min = each.value.frequency_min
  locations     = each.value.locations

  outage_handling {
    global_consecutive_outage_count_threshold = each.value.outage_handling.global_consecutive_outage_count_threshold
    global_outages                            = each.value.outage_handling.global_outages
  }

  performance_thresholds {
    enabled = each.value.performance_thresholds.enabled

    thresholds {
      dynamic "threshold" {
        for_each = each.value.performance_thresholds.thresholds
        content {
          aggregation        = threshold.value.aggregation
          dealerting_samples = threshold.value.dealerting_samples
          samples            = threshold.value.samples
          step_index         = threshold.value.step_index
          threshold          = threshold.value.threshold
          violating_samples  = threshold.value.violating_samples
        }
      }
    }
  }

  steps {
    dynamic "step" {
      for_each = each.value.steps
      content {
        name         = step.value.name
        request_type = step.value.request_type
        target_list  = step.value.target_list
        properties   = step.value.properties

        constraints {
          dynamic "constraint" {
            for_each = step.value.constraints
            content {
              type       = constraint.value.type
              properties = constraint.value.properties
            }
          }
        }

        request_configurations {
          dynamic "request_configuration" {
            for_each = step.value.request_configurations
            content {
              constraints {
                dynamic "constraint" {
                  for_each = request_configuration.value.constraints
                  content {
                    type       = constraint.value.type
                    properties = constraint.value.properties
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  tags {
    dynamic "tag" {
      for_each = each.value.tags
      content {
        context = tag.value.context
        key     = tag.value.key
        source  = tag.value.source
        value   = tag.value.value
      }
    }
  }
}
