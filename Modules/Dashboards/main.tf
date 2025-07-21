terraform {
  required_version = ">= 1.0"
}

provider "dynatrace" {
  # Provider configuration assumed to be handled elsewhere
}

module "allowlist_urlpatterns" {
  source                = "./modules/dynatrace_dashboards_allowlist"
  allowlist_urlpatterns = var.allowlist_urlpatterns
}


module "default_dashboards" {
  source             = "./modules/dynatrace_dashboards_general"
  default_dashboards = var.default_dashboards
  enable_public_sharing = var.enable_public_sharing
}

module "enable_dashboard_presets" {
  source                   = "./modules/dynatrace_dashboards_presets"
  enable_dashboard_presets = var.enable_dashboard_presets
}

module "dashboard_presets" {
  source            = "./modules/dynatrace_dashboards_presets"
  dashboard_presets = var.dashboard_presets
}

module "json_dashboards" {
  source         = "./modules/dynatrace_json_dashboard"
  json_dashboards = var.json_dashboards
}
