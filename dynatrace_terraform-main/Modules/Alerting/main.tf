module "alerting_profile" {
  source           = "./modules/dynatrace_alerting"
  alerting_name    = var.alerting_name
  management_zone  = var.management_zone
  rules            = var.rules
}


module "connectivity_alerts" {
  source ="./modules/dynatrace_connectivity_alerts" 

  count               = var.enable_connectivity_alerts ? 1 : 0
  connectivity_alerts = var.connectivity_alerts
  process_group_id    = var.process_group_id
}


module "maintenance_window" {
  source                        = "./modules/dynatrace_maintenance"
  maintenance_enabled           = var.maintenance_enabled
  maintenance_name              = var.maintenance_name
  maintenance_description       = var.maintenance_description
  maintenance_type              = var.maintenance_type
  maintenance_disable_synthetic = var.maintenance_disable_synthetic
  maintenance_suppression       = var.maintenance_suppression
  schedule_type                 = var.schedule_type
  weekly_recurrence_day_of_week = var.weekly_recurrence_day_of_week
  recurrence_range_end_date     = var.recurrence_range_end_date
  recurrence_range_start_date   = var.recurrence_range_start_date
  time_window_end_time          = var.time_window_end_time
  time_window_start_time        = var.time_window_start_time
  time_window_time_zone         = var.time_window_time_zone
  filters                       = var.filters
}
