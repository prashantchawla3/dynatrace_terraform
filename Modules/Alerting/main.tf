resource "dynatrace_alerting" "example" {
  name            = var.alerting_name
  management_zone = var.alerting_management_zone
  rules {
    rule {
      include_mode     = "INCLUDE_ALL"
      tags             = var.alerting_rule_1_tags
      delay_in_minutes = var.alerting_rule_1_delay_in_minutes
      severity_level   = var.alerting_rule_1_severity_level
    }
    rule {
      include_mode     = "INCLUDE_ALL"
      tags             = var.alerting_rule_2_tags
      delay_in_minutes = var.alerting_rule_2_delay_in_minutes
      severity_level   = var.alerting_rule_2_severity_level
    }
    rule {
      include_mode     = "INCLUDE_ALL"
      tags             = var.alerting_rule_3_tags
      delay_in_minutes = var.alerting_rule_3_delay_in_minutes
      severity_level   = var.alerting_rule_3_severity_level
    }
    rule {
      include_mode     = "INCLUDE_ALL"
      tags             = var.alerting_rule_4_tags
      delay_in_minutes = var.alerting_rule_4_delay_in_minutes
      severity_level   = var.alerting_rule_4_severity_level
    }
    rule {
      include_mode     = "INCLUDE_ALL"
      tags             = var.alerting_rule_5_tags
      delay_in_minutes = var.alerting_rule_5_delay_in_minutes
      severity_level   = var.alerting_rule_5_severity_level
    }
    rule {
      include_mode     = "INCLUDE_ALL"
      tags             = var.alerting_rule_6_tags
      delay_in_minutes = var.alerting_rule_6_delay_in_minutes
      severity_level   = var.alerting_rule_6_severity_level
    }
  }
}

resource "dynatrace_connectivity_alerts" "example" {
  connectivity_alerts = var.connectivity_alerts
  process_group_id    = var.process_group_id
}

resource "dynatrace_maintenance" "example" {
  enabled = var.maintenance_enabled
  general_properties {
    name              = var.maintenance_name
    description       = var.maintenance_description
    type              = var.maintenance_type
    disable_synthetic = var.maintenance_disable_synthetic
    suppression       = var.maintenance_suppression
  }
  schedule {
    type = var.maintenance_schedule_type
    weekly_recurrence {
      day_of_week = var.maintenance_weekly_day_of_week
      recurrence_range {
        end_date   = var.maintenance_weekly_end_date
        start_date = var.maintenance_weekly_start_date
      }
      time_window {
        end_time   = var.maintenance_weekly_end_time
        start_time = var.maintenance_weekly_start_time
        time_zone  = var.maintenance_weekly_time_zone
      }
    }
  }