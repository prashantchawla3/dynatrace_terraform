resource "dynatrace_openpipeline_logs" "this" {
  count = var.enable_logs ? 1 : 0

  dynamic "pipelines" {
    for_each = var.logs_pipelines
    content {
      pipeline {
        enabled      = pipelines.value.enabled
        display_name = pipelines.value.display_name
        id           = pipelines.value.id
      }
    }
  }
}
