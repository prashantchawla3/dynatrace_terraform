resource "dynatrace_log_events" "this" {
  for_each = var.resources["log_events"]

  enabled = each.value.enabled
  query   = each.value.query
  summary = each.value.summary

  event_template {
    description = each.value.event_template.description
    event_type  = each.value.event_template.event_type
    title       = each.value.event_template.title

    metadata {
      dynamic "item" {
        for_each = each.value.event_template.metadata.items
        content {
          metadata_key   = item.value.metadata_key
          metadata_value = item.value.metadata_value
        }
      }
    }
  }
}
