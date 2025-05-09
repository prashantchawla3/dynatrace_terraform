resource "dynatrace_alerting_profile" "this" {
  display_name = var.name

  dynamic "rules" {
    for_each = var.rules
    content {
      severity_level   = rules.value.severity_level
      delay_in_minutes = rules.value.delay_in_minutes

      tag_filter {
        include_mode = rules.value.include_mode

        dynamic "tag_filters" {
          for_each = rules.value.tags != null ? rules.value.tags : []
          content {
            context = "CONTEXTLESS"
            key     = tag_filters.value.key
            value   = tag_filters.value.value
          }
        }
      }
    }
  }
}

resource "dynatrace_maintenance" "this" {
  for_each = var.maintenance_windows

  name        = each.value.name
  description = each.value.description
  enabled     = true

  schedule {
    recurrence_type = each.value.schedule_type
    start           = each.value.start_time
    end             = each.value.end_time
    time_zone       = each.value.time_zone
  }

  scope {
    matches {
      type  = "TAG"
      key   = "Environment"
      value = "production"
    }
  }
}
