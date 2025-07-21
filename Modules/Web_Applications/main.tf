
# ─── Core Web Application Settings ─────────────────────────
module "web_application_core" {
  source            = "./modules/dynatrace_web_application"
  application_id    = var.application_id
  web_applications  = var.web_applications
}

# ─── Beacon Endpoints & Origins ───────────────────────────
module "web_beacons" {
  source                    = "./modules/web_beacons"
  web_app_beacon_endpoints = var.web_app_beacon_endpoints
  web_app_beacon_origins   = var.web_app_beacon_origins
}

# ─── JavaScript Tag Versions & Updates ────────────────────
module "web_javascript_update" {
  source                   = "./modules/web_javascript_update"
  javascript_version       = var.javascript_version
  javascript_filename      = var.javascript_filename
  web_javascript_updates   = var.web_javascript_updates
  web_javascript_versions  = var.web_javascript_versions
  custom_javascript_version = var.custom_javascript_version
}

# ─── Auto & Custom Injection Rules ────────────────────────
module "web_custom_injection" {
  source                        = "./modules/web_custom_injection"
  web_app_custom_injections     = var.web_app_custom_injections
  web_app_injection_cookies     = var.web_app_injection_cookies
  insert_after                  = var.insert_after
}

# ─── RUM & Session Replay Enablement ──────────────────────
module "web_enablements" {
  source              = "./modules/web_enablements"
  web_app_enablements = var.web_app_enablements
}

# ─── Performance Threshold Rules ──────────────────────────
module "web_kpm_thresholds" {
  source                         = "./modules/web_kpm_thresholds"
  web_app_key_performance_customs = var.web_app_key_performance_customs
  web_app_key_performance_loads   = var.web_app_key_performance_loads
  web_app_key_performance_xhrs    = var.web_app_key_performance_xhrs
}

# ─── Custom & Request Error Logic ─────────────────────────
module "web_custom_errors" {
  source               = "./modules/web_custom_errors"
  web_app_custom_errors = var.web_app_custom_errors
  web_app_request_errors = var.web_app_request_errors
}

# ─── Resource Cleanup & Classification ────────────────────
module "web_resource_management" {
  source                    = "./modules/web_resource_management"
  web_app_resource_cleanups = var.web_app_resource_cleanups
  web_resource_types        = var.web_resource_types
  primary_resource_type     = var.primary_resource_type
  secondary_resource_type   = var.secondary_resource_type
  regular_expression        = var.regular_expression
  insert_after              = var.insert_after
}

# ─── Detection Rule Configuration ─────────────────────────
module "web_detection_rules" {
  source         = "./modules/web_detection_rules"
  application_identifier = var.application_identifier
  filter_config          = var.filter_config
  name                   = var.name
  order                  = var.order
}

# ─── Event & Session Property Allow Lists ─────────────────
module "web_custom_properties" {
  source                         = "./modules/web_custom_properties"
  custom_event_properties_allow_list   = var.custom_event_properties_allow_list
  custom_session_properties_allow_list = var.custom_session_properties_allow_list
}

# ─── Configuration Properties for Application ─────────────
module "web_config_properties" {
  source                  = "./modules/web_config_properties"
  custom_config_properties = var.custom_config_properties
}

# ─── Calculated Metrics for Web UX ────────────────────────
module "web_calculated_metrics" {
  source                = "./modules/web_calculated_metrics"
  calculated_web_metrics = var.calculated_web_metrics
}

# ─── Key User Action Flags ────────────────────────────────
module "web_key_user_actions" {
  source             = "./modules/web_key_user_actions"
  key_user_actions   = var.key_user_actions
}
