resource "dynatrace_golden_state" "golden_state_auto_delete" {
  mode                        = var.auto_delete_mode
  dynatrace_management_zone_v2 = var.auto_delete_management_zone_ids
  dynatrace_alerting           = var.auto_delete_alerting_ids
}
