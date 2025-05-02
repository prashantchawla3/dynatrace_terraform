# Alerting Profile resource configuration
resource "dynatrace_alerting" "this" {
  name            = var.name
  description     = var.description
  # Scope by a Dynatrace Management Zone (ID/legacy ID)
  management_zone = var.management_zone_id

  # Dynamic block for severity rules (one or more)
  rules {
    dynamic "rule" {
      for_each = var.rules
      content {
        severity_level           = rule.value.severity_level      # e.g. "ERRORS", "PERFORMANCE" etc.
        delay_in_minutes         = rule.value.delay_in_minutes    # Minutes to wait before alerting
        include_mode             = rule.value.include_mode        # Tag filter include mode (NONE/ANY/ALL):contentReference[oaicite:6]{index=6}
        tag_filter_include_mode  = lookup(rule.value, "tag_filter_include_mode", null)
        tags                     = lookup(rule.value, "tags", [])
      }
    }
  }

  # Dynamic block for event filters (custom and predefined)
  filters {
    dynamic "filter" {
      for_each = var.filters
      content {
        type = filter.value.type   # "PREDEFINED" or "CUSTOM"

        # Predefined event filter (based on built-in event types)
        predefined_event_filter {
          event_type = filter.value.predefined_event_type  # e.g. "APPLICATION_ERROR_RATE_INCREASED"
          negate     = filter.value.predefined_negate      # Exclude if true
        }

        # Custom event filter (based on title/description text or metadata)
        custom_event_filter {
          # Title-based text filter
          title {
            operator       = filter.value.custom_title_operator      # e.g. "CONTAINS", "STRING_EQUALS"
            value          = filter.value.custom_title_value         # Text to match in title
            negate         = filter.value.custom_title_negate        # Exclude if true
            enabled        = filter.value.custom_title_enabled       # Apply this title filter
            case_sensitive = filter.value.custom_title_case_sensitive
          }
          # Description-based text filter
          description {
            operator       = filter.value.custom_description_operator
            value          = filter.value.custom_description_value
            negate         = filter.value.custom_description_negate
            enabled        = filter.value.custom_description_enabled
            case_sensitive = filter.value.custom_description_case_sensitive
          }
          # Metadata filter (key/value pairs)
          metadata {
            dynamic "filter_item" {
              for_each = filter.value.custom_metadata
              content {
                metadata_key   = filter_item.value.key
                metadata_value = filter_item.value.value
                negate         = filter_item.value.negate
              }
            }
          }
        }
      }
    }
  }

  # (Optional) Legacy ID for older config integrations (computed attribute in provider)
  # legacy_id is available as an output for use by other resources:contentReference[oaicite:7]{index=7}.
}

# Optional resource: Dynatrace Connectivity Alerts for specific process groups
resource "dynatrace_connectivity_alerts" "this" {
  for_each = { for k, v in var.connectivity_alerts : k => v if v.process_group_id != "" }
  process_group_id   = each.value.process_group_id
  connectivity_alerts = each.value.enable     # Toggle TCP connectivity problem alerts:contentReference[oaicite:8]{index=8}
}

# Optional resource: Dynatrace Maintenance Windows
resource "dynatrace_maintenance" "this" {
  for_each = { for k, v in var.maintenance_windows : k => v if v.name != "" }

  enabled                             = each.value.enabled
  name                                = each.value.name
  description                         = lookup(each.value, "description", null)
  maintenance_type                    = each.value.maintenance_type      # "PLANNED" or "UNPLANNED"
  suppression                         = each.value.suppression          # "DETECT_PROBLEMS_AND_ALERT", etc.
  disable_synthetic_monitor_execution = each.value.disable_synthetic

  # Optional filters (restricts entities in scope of maintenance)
  filters {
    # By management zone IDs (list of Dynatrace Management Zone IDs)
    management_zone = each.value.management_zones

    # By entity tags (logical AND of tags)
    tag_filter_include_mode = lookup(each.value, "tag_filter_include_mode", null)
    tags                    = lookup(each.value, "tags", [])

    # By specific entity (e.g. a host or process group ID)
    entity_id              = lookup(each.value, "entity_id", null)
  }

  # Maintenance schedule configuration (supports once, daily, weekly, monthly)
  schedule {
    type = each.value.schedule_type   # e.g. "ONCE", "DAILY", "WEEKLY", "MONTHLY"

    # Time window for maintenance (required)
    time_window {
      start_time = each.value.start_time   # e.g. "02:00"
      end_time   = each.value.end_time     # e.g. "04:00"
      time_zone  = each.value.time_zone
    }

    # Recurrence range (dates) 
    recurrence_range {
      start_date = each.value.start_date   # e.g. "2025-01-01"
      end_date   = each.value.end_date     # e.g. "2025-12-31"
    }

    # Weekly recurrence (if type = "WEEKLY")
    weekly {
      day_of_week = each.value.days_of_week   # e.g. ["SATURDAY", "SUNDAY"]
    }
    # Monthly recurrence (if type = "MONTHLY")
    monthly {
      day_of_month = each.value.day_of_month  # e.g. 15
    }
    # Once recurrence is handled by schedule type "ONCE" above
  }
}
