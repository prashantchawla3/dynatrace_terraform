
# ─── Monitor Cookies ────────────────────────────────────────
module "http_monitor_cookies" {
  source               = "./modules/dynatrace_http_monitor_cookies"
  http_monitor_cookies = var.http_monitor_cookies
}

# ─── Outage Monitoring Flags ────────────────────────────────
module "enable_outage_monitoring" {
  source                  = "./modules/dynatrace_http_monitor_outage"
  enable_outage_monitoring = var.enable_outage_monitoring
}

module "global_consecutive_outage_count_threshold" {
  source                             = "./modules/dynatrace_http_monitor_outage"
  global_consecutive_outage_count_threshold = var.global_consecutive_outage_count_threshold
}

module "global_outages" {
  source         = "./modules/dynatrace_http_monitor_outage
}

module "local_consecutive_outage_count_threshold" {
  source                             = "./modules/dynatrace_http_monitor_outage"
  local_consecutive_outage_count_threshold = var.local_consecutive_outage_count_threshold
}

module "local_location_outage_count_threshold" {
  source                            = "./modules/dynatrace_http_monitor_outage"
  local_location_outage_count_threshold = var.local_location_outage_count_threshold
}

module "local_outages" {
  source       = "./modules/dynatrace_http_monitor_outage"
  local_outages = var.local_outages
}

module "outage_scope" {
  source       = "./modules/dynatrace_http_monitor_outage"
  outage_scope = var.outage_scope
}

# ─── Performance Threshold Monitors ─────────────────────────
module "performance_monitors" {
  source              = "./modules/dynatrace_http_monitor_performance"
  performance_monitors = var.performance_monitors
}

# ─── Synthetic Scripts ──────────────────────────────────────
module "scripts" {
  source   = "./modules/dynatrace_http_monitor_script"
  scripts  = var.scripts
}

# ─── Synthetic Monitors ─────────────────────────────────────
module "monitors" {
  source   = "./modules/dynatrace_http_monitor"
  monitors = var.monitors
}
