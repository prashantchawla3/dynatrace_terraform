resource "dynatrace_openpipeline_events" "this" {
  count = var.enable_events ? 1 : 0

  dynamic "endpoints" {
    for_each = var.events_endpoints
    content {
      endpoint {
        enabled        = endpoints.value.enabled
        default_bucket = endpoints.value.default_bucket
        display_name   = endpoints.value.display_name
        segment        = endpoints.value.segment

        routing {
          type        = endpoints.value.routing.type
          pipeline_id = endpoints.value.routing.pipeline_id
        }
      }
    }
  }

  dynamic "pipelines" {
    for_each = var.events_pipelines
    content {
      pipeline {
        enabled      = pipelines.value.enabled
        display_name = pipelines.value.display_name
        id           = pipelines.value.id
      }
    }
  }

  dynamic "routing" {
    for_each = var.events_routing
    content {
      entry {
        enabled     = routing.value.enabled
        matcher     = routing.value.matcher
        note        = routing.value.note
        pipeline_id = routing.value.pipeline_id
      }
    }
  }
}
