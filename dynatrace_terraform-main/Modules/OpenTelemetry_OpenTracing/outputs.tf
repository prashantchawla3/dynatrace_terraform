output "configured_allow_list_keys" {
  value = keys(var.attribute_allow_list)
}

output "configured_block_list_keys" {
  value = keys(var.attribute_block_list)
}

output "configured_masking_keys" {
  value = keys(var.attribute_masking)
}

output "configured_opentelemetry_metrics" {
  value = keys(var.opentelemetry_metrics)
}

output "configured_span_capture_rules" {
  value = keys(var.span_capture_rules)
}

output "configured_span_context_propagation" {
  value = keys(var.span_context_propagation)
}

output "configured_span_entry_points" {
  value = keys(var.span_entry_points)
}

output "configured_attributes_preferences" {
  value = keys(var.attributes_preferences)
}
