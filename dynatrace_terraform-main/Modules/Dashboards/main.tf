module "dashboards_allowlist" {
  source = "./modules/dynatrace_dashboards_allowlist"

  allowlist_urlpatterns = var.allowlist_urlpatterns
}

module "dashboards_general" {
  source = "./modules/dynatrace_dashboards_general"

  enable_public_sharing = var.enable_public_sharing
  default_dashboards    = var.default_dashboards
}

module "dashboards_presets" {
  source = "./modules/dynatrace_dashboards_presets"

  enable_dashboard_presets = var.enable_dashboard_presets
  dashboard_presets        = var.dashboard_presets
}

module "json_dashboards" {
  source = "./modules/dynatrace_json_dashboard"

  json_dashboards = var.json_dashboards
}
