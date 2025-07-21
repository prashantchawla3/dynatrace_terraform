resource "dynatrace_openpipeline_business_events" "this" {
  count = var.enable_business_events ? 1 : 0

  dynamic "pipelines" {
    for_each = var.business_event_pipelines
    content {
      pipeline {
        enabled      = pipelines.value.enabled
        display_name = pipelines.value.display_name
        id           = pipelines.value.id

        dynamic "processing" {
          for_each = pipelines.value.processing
          content {
            processor {
              fields_remove_processor {
                description = processing.value.description
                enabled     = processing.value.enabled
                fields      = processing.value.fields
                id          = processing.value.id
                matcher     = processing.value.matcher
              }
            }
          }
        }
      }
    }
  }
}
