
# ─── Management Zone Variables ─────────────────────────────
module "zone_name" {
  source     = "./modules/dynatrace_management_zone_v2"
  zone_name  = var.zone_name
}

module "zone_description" {
  source            = "./modules/dynatrace_management_zone_v2"
  zone_description  = var.zone_description
}

module "zone_legacy_id" {
  source         = "./modules/dynatrace_management_zone_v2"
  zone_legacy_id = var.zone_legacy_id
}

module "entity_selector" {
  source           = "./modules/dynatrace_management_zone_v2"
  entity_selector  = var.entity_selector
}
