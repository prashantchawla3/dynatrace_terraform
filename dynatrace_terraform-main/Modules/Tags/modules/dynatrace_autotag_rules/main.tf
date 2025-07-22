resource "dynatrace_autotag_rules" "example" {
  auto_tag_id = dynatrace_autotag_v2.example.id

  dynamic "rules" {
    for_each = var.autotag_selector_rules
    content {
      rule {
        type                = rules.value.type
        enabled             = rules.value.enabled
        entity_selector     = rules.value.entity_selector
        value_format        = rules.value.value_format
        value_normalization = rules.value.value_normalization
      }
    }
  }
}
