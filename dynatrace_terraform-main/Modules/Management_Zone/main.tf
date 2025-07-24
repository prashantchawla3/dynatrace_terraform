
# ─── Management Zone Configuration ────────────────────────
module "management_zone" {
  source          = "./modules/dynatrace_management_zone_v2"
  zone_name       = var.zone_name
  zone_description = var.zone_description
  zone_legacy_id  = var.zone_legacy_id
  entity_selector = var.entity_selector
}
