resource "dynatrace_attribute_block_list" "this" {
  for_each = var.attribute_block_list
  enabled  = each.value.enabled
  key      = each.value.key
}
