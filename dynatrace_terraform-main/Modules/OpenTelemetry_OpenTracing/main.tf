resource "dynatrace_attribute_allow_list" "this" {
  for_each = var.attribute_allow_list
  enabled  = each.value.enabled
  key      = each.value.key
}

resource "dynatrace_attribute_block_list" "this" {
  for_each = var.attribute_block_list
  enabled  = each.value.enabled
  key      = each.value.key
}

resource "dynatrace_attribute_masking" "this" {
  for_each = var.attribute_masking
  enabled  = each.value.enabled
  key      = each.value.key
  masking  = each.value.masking
}

resource "dynatrace_opentelemetry_metrics" "this" {
  for_each = var.opentelemetry_metrics

  additional_attributes_to_dimension_enabled = each.value.additional_attributes_to_dimension_enabled
  meter_name_to_dimension_enabled           = each.value.meter_name_to_dimension_enabled
  scope                                     = each.value.scope

  additional_attributes {
    dynamic "additional_attribute" {
      for_each = each.value.additional_attributes
      content {
        enabled       = additional_attribute.value.enabled
        attribute_key = additional_attribute.value.attribute_key
      }
    }
  }

  to_drop_attributes {
    dynamic "to_drop_attribute" {
      for_each = each.value.to_drop_attributes
      content {
        enabled       = to_drop_attribute.value.enabled
        attribute_key = to_drop_attribute.value.attribute_key
      }
    }
  }
}

resource "dynatrace_span_capture_rule" "this" {
  for_each = var.span_capture_rules

  name   = each.key
  action = each.value.action

  matches {
    dynamic "match" {
      for_each = each.value.matches
      content {
        comparison = match.value.comparison
        source     = match.value.source
        value      = match.value.value
      }
    }
  }
}

resource "dynatrace_span_context_propagation" "this" {
  for_each = var.span_context_propagation

  name   = each.key
  action = each.value.action

  matches {
    dynamic "match" {
      for_each = each.value.matches
      content {
        comparison = match.value.comparison
        source     = match.value.source
        value      = match.value.value
      }
    }
  }
}

resource "dynatrace_span_entry_point" "this" {
  for_each = var.span_entry_points

  name   = each.key
  action = each.value.action

  matches {
    dynamic "match" {
      for_each = each.value.matches
      content {
        case_sensitive = match.value.case_sensitive
        comparison     = match.value.comparison
        source         = match.value.source
        value          = match.value.value
      }
    }
  }
}

resource "dynatrace_attributes_preferences" "this" {
  for_each         = var.attributes_preferences
  persistence_mode = each.value.persistence_mode
}
