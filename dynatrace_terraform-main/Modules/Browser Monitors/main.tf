
module "browser_monitor" {
  source           = "./modules/dynatrace_browser_monitor"
  browser_monitors = var.browser_monitors
}

module "browser_monitor_performance" {
  source           = "./modules/dynatrace_browser_monitor_performance"
  browser_monitors = var.browser_monitors
}

module "browser_monitor_outage" {
  source           = "./modules/dynatrace_browser_monitor_outage"
  browser_monitors = var.browser_monitors
}
