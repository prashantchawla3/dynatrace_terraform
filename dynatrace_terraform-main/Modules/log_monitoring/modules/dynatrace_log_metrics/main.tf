resource "dynatrace_log_metrics" "this" {
  for_each = var.resources["log_metrics"]

  enabled           = each.value.enabled
  dimensions        = each.value.dimensions
  key               = each.value.key
  measure           = each.value.measure
  measure_attribute = each.value.measure_attribute
  query             = each.value.query
}
