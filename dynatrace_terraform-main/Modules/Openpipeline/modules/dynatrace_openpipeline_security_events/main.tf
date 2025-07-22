resource "dynatrace_openpipeline_security_events" "this" {
  count = var.enable_security_events ? 1 : 0

  dynamic "pipelines" {
    for_each = var.security_event_pipelines
    content {
      pipeline {
        enabled      = pipelines.value.enabled
        display_name = pipelines.value.display_name
        id           = pipelines.value.id
      }
    }
  }
}
