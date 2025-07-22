resource "dynatrace_oneagent_updates" "this" {
  scope          = var.scope_oneagent
  target_version = var.target_version
  update_mode    = var.update_mode
}