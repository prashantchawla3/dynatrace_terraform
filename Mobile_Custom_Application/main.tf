

# ─── Calculated Mobile Metrics ────────────────────────────
module "calculated_mobile_metrics" {
  source                  = "./modules/dynatrace_calculated_mobile_metrics"
  calculated_mobile_metrics = var.calculated_mobile_metrics
}

# ─── Custom App RUM Enablements ───────────────────────────
module "custom_app_enablements" {
  source                  = "./modules/dynatrace_custom_app_enablement"
  custom_app_enablements = var.custom_app_enablements
}

# ─── Mobile App RUM & Replay ──────────────────────────────
module "mobile_app_enablements" {
  source                  = "./modules/dynatrace_mobile_app_key_performance"
  mobile_app_enablements = var.mobile_app_key_performance
}

# ─── Mobile App Key Performance Thresholds ────────────────
module "mobile_app_key_performance" {
  source                      = "./modules/mobile_app_key_performance"
  mobile_app_key_performance = var.mobile_app_key_performance
}

# ─── Mobile App Request Error Configs ─────────────────────
module "mobile_app_request_errors" {
  source                    = "./modules/dynatrace_mobile_app_request_errors"
  mobile_app_request_errors = var.mobile_app_request_errors
}

# ─── Mobile Application Instrumentation ───────────────────
module "mobile_applications" {
  source              = "./modules/dynatrace_mobile_application"
  mobile_applications = var.mobile_applications
}
