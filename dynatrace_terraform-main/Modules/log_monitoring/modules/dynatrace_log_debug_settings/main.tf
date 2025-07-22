resource "dynatrace_log_debug_settings" "this" {
  for_each = var.resources["log_debug_settings"]
  enabled  = each.value.enabled
}
