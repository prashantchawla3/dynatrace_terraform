

# ─── AutoTag Rules with Property-Based Conditions ─────────
module "autotag_rules" {
  source              = "./modules/dynatrace_autotag_rules"
  autotag_name        = var.autotag_name
  autotag_rules       = var.autotag_rules
}

# ─── AutoTag Rules with Entity Selector Logic ─────────────
module "autotag_selector_v2" {
  source                   = "./modules/dynatrace_autotag_v2"
  autotag_selector_rules   = var.autotag_selector_rules
  entity_selector          = var.entity_selector
}

# ─── Static Custom Tags for Annotation ────────────────────
module "custom_tags" {
  source      = "./modules/dynatrace_custom_tags"
  custom_tags = var.custom_tags
}
