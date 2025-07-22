resource "dynatrace_connectivity_alerts" "this" {
  count               = var.enable_connectivity_alerts ? 1 : 0
  connectivity_alerts = var.connectivity_alerts
  process_group_id    = var.process_group_id
}