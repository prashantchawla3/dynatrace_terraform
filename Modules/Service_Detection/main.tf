
# ─── Custom Service Definitions ─────────────────────────────
module "custom_services" {
  source                = "./modules/dynatrace_custom_service"
  custom_services       = var.custom_services
  custom_service_order  = var.custom_service_order
}

# ─── Management Zone Provisioning ───────────────────────────
module "management_zones" {
  source            = "./modules/dynatrace-management_zone_v2"
  management_zones  = var.management_zones
}

# ─── External Web Request Classification ────────────────────
module "external_web_requests" {
  source                 = "./modules/dynatrace_service_external_web_request"
  external_web_requests  = var.external_web_requests
}

# ─── Full Web Request Rules ─────────────────────────────────
module "full_web_requests" {
  source             = "./modules/dynatrace_service_full_web_requests"
  full_web_requests  = var.full_web_requests
}

# ─── Web Service Classification from Full Requests ──────────
module "full_web_services" {
  source            = "./modules/dynatrace_service_full_web_service"
  full_web_services = var.full_web_services
}

# ─── Unified Services Metrics Enablement ────────────────────
module "unified_services_metrics" {
  source                    = "./modules/dynatrace_unified_services_metrics"
  unified_services_metrics = var.unified_services_metrics
}

# ─── OpenTelemetry Enablement for Services ──────────────────
module "unified_services_opentel" {
  source                   = "./modules/dynatrace_unified_services_opentel"
  unified_services_opentel = var.unified_services_opentel
}

# ─── Scoped Service Detection Rules ─────────────────────────
module "service_detection_rules" {
  source                 = "./modules/dynatrace_service_detection_rules"
  service_detection_rules = var.service_detection_rules
}

# ─── External Web Services Detection ────────────────────────
module "external_web_services" {
  source                 = "./modules/dynatrace_external_web_service"
  external_web_services = var.external_web_services
}

# ─── Service Splitting Logic ────────────────────────────────
module "service_splitting_rules" {
  source                 = "./modules/dynatrace_service_splitting"
  service_splitting_rules = var.service_splitting_rules
}
