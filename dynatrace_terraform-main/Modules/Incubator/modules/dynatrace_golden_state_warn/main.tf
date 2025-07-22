resource "dynatrace_golden_state" "golden_state_warn" {
  mode                  = var.warn_mode
  dynatrace_autotag_v2  = var.warn_autotag_ids
}
