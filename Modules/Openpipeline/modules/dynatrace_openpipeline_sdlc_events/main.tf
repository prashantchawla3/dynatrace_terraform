resource "dynatrace_openpipeline_sdlc_events" "this" {
  count = var.enable_sdlc_events ? 1 : 0

  dynamic "endpoints" {
    for_each = var.sdlc_endpoints
    content {
      endpoint {
        display_name = endpoints.value.display_name
        enabled      = endpoints.value.enabled
        segment      = endpoints.value.segment

        routing {
          type        = endpoints.value.routing.type
          pipeline_id = endpoints.value.routing.pipeline_id
        }
      }
    }
  }

  dynamic "pipelines" {
    for_each = var.sdlc_pipelines
    content {
      pipeline {
        display_name = pipelines.value.display_name
        enabled      = pipelines.value.enabled
        id           = pipelines.value.id
      }
    }
  }

  dynamic "routing" {
    for_each = var.sdlc_routing
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
