resource "dynatrace_log_agent_feature_flags" "this" {
  for_each = var.resources["log_agent_feature_flags"]

  scope                      = each.value.scope
  new_container_log_detector = each.value.new_container_log_detector
}
