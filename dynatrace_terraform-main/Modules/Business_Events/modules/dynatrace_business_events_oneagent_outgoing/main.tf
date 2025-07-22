resource "dynatrace_business_events_oneagent_outgoing" "this" {
  enabled   = var.outgoing_enabled
  rule_name = var.rule_name
  scope     = var.scope

  event {
    category {
      source      = var.outgoing_category_source
      source_type = var.outgoing_category_source_type
    }

    data {
      event_data_field_complex {
        name = var.outgoing_field_name
        source {
          path        = var.outgoing_field_path
          source_type = var.outgoing_field_source_type
        }
      }
    }

    provider {
      source      = var.outgoing_provider_source
      source_type = var.outgoing_provider_source_type
    }

    type {
      source      = var.outgoing_type_source
      source_type = var.outgoing_type_source_type
    }
  }

  triggers {
    trigger {
      type           = var.outgoing_trigger_type
      case_sensitive = var.outgoing_trigger_case_sensitive
      value          = var.outgoing_trigger_value
      source {
        data_source = var.outgoing_trigger_data_source
      }
    }
  }
}
