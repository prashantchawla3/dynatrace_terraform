variable "enable_sdlc_events" {
  description = "Toggle to enable ingestion of Software Development Lifecycle events"
  type        = bool
  default     = false
}

variable "sdlc_endpoints" {
  description = "SDLC event ingestion endpoints with routing and segmentation logic"
  type = list(object({
    display_name = string
    enabled      = bool
    segment      = string
    routing = object({
      type        = string
      pipeline_id = string
    })
  }))
  default = [
    {
      display_name = "SDLC Event Endpoint"
      enabled      = true
      segment      = "development"
      routing = {
        type        = "hash"
        pipeline_id = "sdlc-core"
      }
    }
  ]
}

variable "sdlc_pipelines" {
  description = "SDLC pipelines for processing lifecycle and deployment events"
  type = list(object({
    display_name = string
    enabled      = bool
    id           = string
  }))
  default = [
    {
      display_name = "CI/CD Tracker"
      enabled      = true
      id           = "sdlc-core"
    }
  ]
}

variable "sdlc_routing" {
  description = "Routing rules for SDLC events matched to pipeline destinations"
  type = list(object({
    enabled     = bool
    matcher     = string
    note        = string
    pipeline_id = string
  }))
  default = [
    {
      enabled     = true
      matcher     = "tool == 'jenkins'"
      note        = "Jenkins specific routing"
      pipeline_id = "sdlc-core"
    }
  ]
}
