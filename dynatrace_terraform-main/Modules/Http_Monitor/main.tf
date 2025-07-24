
module "http_monitor" {
  source   = "./modules/dynatrace_http_monitor"
  monitors = var.monitors
}


module "http_monitor_outage" {
  source = "./modules/dynatrace_http_monitor_outage"

  enable_outage_monitoring                 = var.enable_outage_monitoring
  global_consecutive_outage_count_threshold = var.global_consecutive_outage_count_threshold
  global_outages                           = var.global_outages
  local_consecutive_outage_count_threshold = var.local_consecutive_outage_count_threshold
  local_location_outage_count_threshold    = var.local_location_outage_count_threshold
  local_outages                            = var.local_outages
  outage_scope                             = var.outage_scope
}


module "http_monitor_performance" {
  source              = "./modules/dynatrace_http_monitor_performance"
  performance_monitors = var.performance_monitors
}


module "http_monitor_cookies" {
  source               = "./modules/dynatrace_http_monitor_cookies"
  http_monitor_cookies = var.http_monitor_cookies
}


module "http_monitor_script" {
  source  = "./modules/dynatrace_http_monitor_script"
  scripts = var.scripts
}
