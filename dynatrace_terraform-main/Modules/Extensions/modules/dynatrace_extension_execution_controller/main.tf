resource "dynatrace_extension_execution_controller" "this" {
  count = length(var.execution_controllers)

  enabled             = var.execution_controllers[count.index].enabled
  ingest_active       = var.execution_controllers[count.index].ingest_active
  performance_profile = var.execution_controllers[count.index].performance_profile
  scope               = var.execution_controllers[count.index].scope
  statsd_active       = var.execution_controllers[count.index].statsd_active
}
