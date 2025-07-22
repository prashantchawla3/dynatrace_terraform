resource "dynatrace_custom_tags" "example" {
  entity_selector = var.entity_selector

  tags {
    dynamic "filter" {
      for_each = var.custom_tags
      content {
        context = filter.value.context
        key     = filter.value.key
        value   = lookup(filter.value, "value", null)
      }
    }
  }
}