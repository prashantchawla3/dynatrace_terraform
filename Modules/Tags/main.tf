
# ─── Metadata-Based AutoTag Rules ─────────────────────────
module "autotag_v2" {
  source         = "./modules/dynatrace_autotag_v2"

  autotag_name   = var.autotag_name
  autotag_rules  = var.autotag_rules
}

# ─── Entity Selector-Based AutoTag Rules ──────────────────
module "autotag_selector_rules" {
  source                 = "./modules/dynatrace_autotag_rules"

  autotag_name           = var.autotag_name
  autotag_selector_rules = var.autotag_selector_rules
}

# ─── Custom Static Tag Assignments ────────────────────────
module "custom_tags" {
  source          = "./modules/dynatrace_custom_tags"

  entity_selector = var.entity_selector
  custom_tags     = var.custom_tags
}
