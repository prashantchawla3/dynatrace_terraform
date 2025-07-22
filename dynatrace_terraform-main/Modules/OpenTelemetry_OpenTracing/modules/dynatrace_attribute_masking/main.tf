resource "dynatrace_attribute_masking" "this" {
  for_each = var.attribute_masking
  enabled  = each.value.enabled
  key      = each.value.key
  masking  = each.value.masking
}
