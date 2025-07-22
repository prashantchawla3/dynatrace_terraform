resource "dynatrace_business_events_oneagent" "this" {
  enabled   = var.oneagent_enabled
  rule_name = var.rule_name
  scope     = var.scope

  event {
    category {
      source_type = var.category_source_type
    }

    data {
      dynamic "event_data_field_complex" {
        for_each = var.event_data_fields
        content {
          name = event_data_field_complex.value.name
          source {
            path        = lookup(event_data_field_complex.value.source, "path", null)
            source      = lookup(event_data_field_complex.value.source, "source", null)
            source_type = event_data_field_complex.value.source.source_type
          }
        }
      }
    }

    provider {
      source      = var.provider_source
      source_type = var.provider_source_type
    }

    type {
      source      = var.type_source
      source_type = var.type_source_type
    }
  }

  triggers {
    trigger {
      type           = var.trigger_type
      case_sensitive = var.trigger_case_sensitive
      value          = var.trigger_value
      source {
        data_source = var.trigger_data_source
      }
    }
  }
}
