# ─── Core Web Application Settings ─────────────────────────
module "web_application_core" {
  source           = "./modules/dynatrace_web_application"
  application_id   = var.application_id
  web_applications = var.web_applications
}

# ─── Beacon Endpoints & Origins ───────────────────────────
module "web_beacons" {
  source                    = "./modules/dynatrace_web_app_beacon_endpoint"
  web_app_beacon_endpoints = var.web_app_beacon_endpoints
}

module "web_beacons" {
  source                    = "./modules/dynatrace_web_app_beacon_origins"
  web_app_beacon_origins   = var.web_app_beacon_origins
}  

# ─── JavaScript Tag Versions & Updates ────────────────────
module "web_javascript_update" {
  source                   = "./modules/dynatrace_web_app_javascript_version"
  javascript_version       = var.javascript_version 
  custom_javascript_version = var.custom_javascript_version
}
module "web_javascript_update" {
  source                   = "./modules/dynatrace_web_app_javascript_filename"
  javascript_filename      = var.javascript_filename
}
module "web_javascript_update" {
  source                   = "./modules/dynatrace_web_app_javascript_updates"
  web_javascript_updates   = var.web_javascript_updates
}


# ─── Auto & Custom Injection Rules ────────────────────────
module "web_custom_injection" {
  source                    = "./modules/dynatrace_custom_web_app_custom_injection"
  web_app_custom_injections = var.web_app_custom_injections
}
module "web_auto_injection" {
  source                    = "./modules/dynatrace_custom_web_app_auto_injection"
  web_app_auto_injections = var.web_app_auto_injections
}

# ─── RUM & Session Replay Enablement ──────────────────────
module "web_enablements" {
  source               = "./modules/dynatrace_web_app_enablement"
  web_app_enablements = var.web_app_enablements
}

# ─── Performance Threshold Rules ──────────────────────────
module "web_kpm_thresholds" {
  source                            = "./modules/dynatrace_web_app_key_performance_custom"
  web_app_key_performance_customs  = var.web_app_key_performance_customs
}
module "web_kpm_thresholds" {
  source                            = "./modules/dynatrace_web_app_key_performance_load"
  web_app_key_performance_xhrs  = var.web_app_key_performance_loads
}
module "web_kpm_thresholds" {
  source                            = "./modules/dynatrace_web_app_key_performance_xhr"
  web_app_key_performance_xhrs  = var.web_app_key_performance_xhrs
}


# ─── Custom & Request Error Logic ─────────────────────────
module "web_custom_errors" {
  source                   = "./modules/dynatrace_web_app_custom_errors"
  web_app_custom_errors    = var.web_app_custom_errors
}
module "web_custom_errors" {
  source                   = "./modules/dynatrace_web_app_request_errors"
  web_app_custom_errors    = var.web_app_request_errors
}

# ─── Resource Cleanup & Classification ────────────────────
module "web_resource_management" {
  source                  = "./modules/dynatrace_web_app_resource_cleanup"
  web_app_resource_cleanups = var.web_app_resource_cleanups
}
module "web_resource_management" {
  source                  = "./modules/dynatrace_web_app_resource_types"
  web_resource_types        = var.web_resource_types
  primary_resource_type     = var.primary_resource_type
  secondary_resource_type   = var.secondary_resource_type
  regular_expression        = var.regular_expression
  insert_after              = var.insert_after
}

# ─── Detection Rule Configuration ─────────────────────────
module "web_detection_rules" {
  source              = "./modules/dynatrace_web-app_detection_rule"
  application_identifier = var.app_detection_rules
  filter_config       = var.filter_config
  name                = var.name
  order               = var.order
}
module "web_detection_rules" {
  source              = "./modules/dynatrace_web-app_detection_rule_v2"
  application_identifier = var.app_detection_rules
}

# ─── Event & Session Property Allow Lists ─────────────────
module "web_custom_properties" {
  source                            = "./modules/dynatrace_web_app_custom_prop_restrictions"
  application_id  = var.custom_event_properties_allow_list
  custom_event_properties_allow_list  = var.application_id
  custom_session_properties_allow_list = var.custom_session_properties_allow_list
}

# ─── Configuration Properties for Application ─────────────
module "web_config_properties" {
  source                            = "./modules/dynatrace_web_app_custom_config_properties"
  custom_config_properties = var.custom_config_properties
}

# ─── Calculated Metrics for Web UX ────────────────────────
module "web_calculated_metrics" {
  source               = "./modules/dynatrace_web_app_calculated_metrics"
  calculated_web_metrics = var.calculated_web_metrics
}

# ─── Key User Action Flags ────────────────────────────────
module "web_key_user_actions" {
  source            = "./modules/dynatrace_key_user_action"
  key_user_actions  = var.key_user_actions
}
