resource "dynatrace_extension_execution_remote" "this" {
  count = length(var.execution_remotes)

  performance_profile = var.execution_remotes[count.index].performance_profile
  scope               = var.execution_remotes[count.index].scope
}
