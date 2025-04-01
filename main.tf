module "Management_Zone" {
  source           = "./Modules/Management_Zone"
  zone_name        = var.zone_name
  zone_description = var.zone_description
  zone_legacy_id   = var.zone_legacy_id
  entity_selector  = var.entity_selector
}