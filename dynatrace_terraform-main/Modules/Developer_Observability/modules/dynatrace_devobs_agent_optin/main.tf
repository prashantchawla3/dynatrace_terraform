resource "dynatrace_devobs_agent_optin" "this" {
  scope   = var.agent_optin_scope
  enabled = var.agent_optin_enabled
}
