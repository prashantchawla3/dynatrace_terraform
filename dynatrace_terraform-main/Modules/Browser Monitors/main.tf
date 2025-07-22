module "dynatrace_browser_monitor" {
  source            = "./modules/dynatrace_browser_monitor"
  browser_monitors = var.browser_monitors
}
