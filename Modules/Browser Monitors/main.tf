module "browser_monitors" {
  source            = "./modules/dynatrace_browser_monitor"
  browser_monitors = var.browser_monitors
}
