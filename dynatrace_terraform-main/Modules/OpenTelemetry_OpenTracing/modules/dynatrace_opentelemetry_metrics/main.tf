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
