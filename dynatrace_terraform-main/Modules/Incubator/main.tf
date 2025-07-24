
module "golden_state_auto_delete" {
  source                           = "./modules/dynatrace_golden_state_auto_delete"
  auto_delete_mode                 = var.auto_delete_mode
  auto_delete_management_zone_ids = var.auto_delete_management_zone_ids
  auto_delete_alerting_ids        = var.auto_delete_alerting_ids
}

module "golden_state_warn" {
  source           = "./modules/dynatrace_golden_state_warn"
  warn_mode        = var.warn_mode
  warn_autotag_ids = var.warn_autotag_ids
}
