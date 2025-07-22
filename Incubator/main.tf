
# ─── Golden State: Auto-Delete Enforcement ────────────────
module "auto_delete_mode" {
  source            = "./modules/dynatrace_golden_state_auto_delete"
  auto_delete_mode  = var.auto_delete_mode
}

module "auto_delete_management_zone_ids" {
  source                         = "./modules/dynatrace_golden_state_auto_delete"
  auto_delete_management_zone_ids = var.auto_delete_management_zone_ids
}

module "auto_delete_alerting_ids" {
  source                   = "./modules/dynatrace_golden_state_auto_delete"
  auto_delete_alerting_ids = var.auto_delete_alerting_ids
}

# ─── Golden State: Warning Enforcement ────────────────────
module "warn_mode" {
  source     = "./modules/dynatrace_golden_state_warn"
  warn_mode  = var.warn_mode
}

module "warn_autotag_ids" {
  source          = "./modules/dynatrace_golden_state_warn"
  warn_autotag_ids = var.warn_autotag_ids
}
