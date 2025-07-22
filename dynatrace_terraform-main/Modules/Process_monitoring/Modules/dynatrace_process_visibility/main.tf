resource "dynatrace_process_visibility" "process_visibility" {
  enabled       = var.process_visibility_enabled
  max_processes = var.process_visibility_max_processes
  scope         = var.process_visibility_scope
}