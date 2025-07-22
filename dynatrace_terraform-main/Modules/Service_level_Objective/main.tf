
# ─── Service-Level Objective Module ───────────────────────
module "slo_module" {
  source = "./modules/dynatrace_slo_v2"
  count  = var.slo_enabled ? 1 : 0

  slo_name                         = var.slo_name
  slo_description                  = var.slo_description
  slo_evaluation_type              = var.slo_evaluation_type
  slo_evaluation_window            = var.slo_evaluation_window
  slo_filter                       = var.slo_filter
  slo_metric_expression            = var.slo_metric_expression
  slo_metric_name                  = var.slo_metric_name
  slo_target_success               = var.slo_target_success
  slo_target_warning               = var.slo_target_warning
  slo_legacy_id                    = var.slo_legacy_id
  burn_rate_visualization_enabled = var.burn_rate_visualization_enabled
  fast_burn_threshold              = var.fast_burn_threshold
}
