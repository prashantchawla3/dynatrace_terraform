module "Management_Zone" {
  source           = "./Modules/Management_Zone"
  zone_name        = var.zone_name
  zone_description = var.zone_description
  zone_legacy_id   = var.zone_legacy_id
  entity_selector  = var.entity_selector
}

module "Alerting" {
  source                           = "./Modules/Alerting"
  alerting_name                    = var.alerting_name
  alerting_management_zone         = module.Management_Zone.management_zone_id # Reference the management zone created
  alerting_rule_1_tags             = var.alerting_rule_1_tags
  alerting_rule_1_delay_in_minutes = var.alerting_rule_1_delay_in_minutes
  alerting_rule_1_severity_level   = var.alerting_rule_1_severity_level
  alerting_rule_2_tags             = var.alerting_rule_2_tags
  alerting_rule_2_delay_in_minutes = var.alerting_rule_2_delay_in_minutes
  alerting_rule_2_severity_level   = var.alerting_rule_2_severity_level
  alerting_rule_3_tags             = var.alerting_rule_3_tags
  alerting_rule_3_delay_in_minutes = var.alerting_rule_3_delay_in_minutes
  alerting_rule_3_severity_level   = var.alerting_rule_3_severity_level
  alerting_rule_4_tags             = var.alerting_rule_4_tags
  alerting_rule_4_delay_in_minutes = var.alerting_rule_4_delay_in_minutes
  alerting_rule_4_severity_level   = var.alerting_rule_4_severity_level
  alerting_rule_5_tags             = var.alerting_rule_5_tags
  alerting_rule_5_delay_in_minutes = var.alerting_rule_5_delay_in_minutes
  alerting_rule_5_severity_level   = var.alerting_rule_5_severity_level
  alerting_rule_6_tags             = var.alerting_rule_6_tags
  alerting_rule_6_delay_in_minutes = var.alerting_rule_6_delay_in_minutes
  alerting_rule_6_severity_level   = var.alerting_rule_6_severity_level
  connectivity_alerts              = var.connectivity_alerts
  process_group_id                 = var.process_group_id
  maintenance_name                 = var.maintenance_name
  maintenance_description          = var.maintenance_description
  maintenance_type                 = var.maintenance_type
  maintenance_disable_synthetic    = var.maintenance_disable_synthetic
  maintenance_suppression          = var.maintenance_suppression
  maintenance_schedule_type        = var.maintenance_schedule_type
  maintenance_weekly_day_of_week   = var.maintenance_weekly_day_of_week
  maintenance_weekly_end_date      = var.maintenance_weekly_end_date
  maintenance_weekly_start_date    = var.maintenance_weekly_start_date
  maintenance_weekly_end_time      = var.maintenance_weekly_end_time
  maintenance_weekly_start_time    = var.maintenance_weekly_start_time
  maintenance_weekly_time_zone     = var.maintenance_weekly_time_zone
  maintenance_filter_entity_type   = var.maintenance_filter_entity_type
  maintenance_filter_entity_tags   = var.maintenance_filter_entity_tags
}

module "Dashboards" {
  source           = "./Modules/Dashboards"
  dashboard_name   = var.dashboard_name
  dashboard_shared = var.dashboard_shared
  dashboard_owner  = var.dashboard_owner
  dashboard_tags   = var.dashboard_tags
  dashboard_preset = var.dashboard_preset
  metric_name      = var.metric_name
}