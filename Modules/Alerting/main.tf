resource "dynatrace_alerting" "this" {
  name             = var.alerting_name
  management_zone  = var.management_zone

  rules {
    dynamic "rule" {
      for_each = var.rules
      content {
        include_mode     = rule.value.include_mode
        tags             = rule.value.tags
        delay_in_minutes = rule.value.delay_in_minutes
        severity_level   = rule.value.severity_level
      }
    }
  }
}

resource "dynatrace_connectivity_alerts" "this" {
  count               = var.enable_connectivity_alerts ? 1 : 0
  connectivity_alerts = var.connectivity_alerts
  process_group_id    = var.process_group_id
}

resource "dynatrace_maintenance" "this" {
  enabled = var.maintenance_enabled

  general_properties {
    name              = var.maintenance_name
    description       = var.maintenance_description
    type              = var.maintenance_type
    disable_synthetic = var.maintenance_disable_synthetic
    suppression       = var.maintenance_suppression
  }

  schedule {
    type = var.schedule_type

    weekly_recurrence {
      day_of_week = var.weekly_recurrence_day_of_week

      recurrence_range {
        end_date   = var.recurrence_range_end_date
        start_date = var.recurrence_range_start_date
      }

      time_window {
        end_time   = var.time_window_end_time
        start_time = var.time_window_start_time
        time_zone  = var.time_window_time_zone
      }
    }
  }

  filters {
    dynamic "filter" {
      for_each = var.filters
      content {
        entity_type = filter.value.entity_type
        entity_tags = filter.value.entity_tags
      }
    }
  }
}
