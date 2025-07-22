resource "dynatrace_attribute_allow_list" "this" {
  for_each = var.attribute_allow_list
  enabled  = each.value.enabled
  key      = each.value.key
}
