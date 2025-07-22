resource "dynatrace_segment" "segment" {
  name        = var.segment_name
  description = var.segment_description
  is_public   = var.segment_is_public

  includes {
    dynamic "items" {
      for_each = var.includes_items
      content {
        data_object = items.value.data_object
        filter      = items.value.filter

        dynamic "relationship" {
          for_each = items.value.relationship != null ? [items.value.relationship] : []
          content {
            name   = relationship.value.name
            target = relationship.value.target
          }
        }
      }
    }
  }

  variables {
    type  = "query"
    value = var.segment_query
  }
}
