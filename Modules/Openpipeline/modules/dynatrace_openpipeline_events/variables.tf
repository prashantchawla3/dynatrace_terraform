variable "enable_events" {
  description = "Toggle to enable standard events ingestion and routing"
  type        = bool
  default     = true
}

variable "events_endpoints" {
  description = "Endpoint definitions for event routing, storage, and segmentation"
  type = list(object({
    enabled        = bool
    default_bucket = string
    display_name   = string
    segment        = string
    routing = object({
      type        = string
      pipeline_id = string
    })
  }))
  default = [
    {
      enabled        = true
      default_bucket = "events-default"
      display_name   = "Events Ingestion EU"
      segment        = "EU"
      routing = {
        type        = "round_robin"
        pipeline_id = "pipeline-eu-core"
      }
    }
  ]
}

variable "events_pipelines" {
  description = "List of event processing pipelines and metadata"
  type = list(object({
    enabled      = bool
    display_name = string
    id           = string
  }))
  default = [
    {
      enabled      = true
      display_name = "Event Normalization"
      id           = "events-core"
    }
  ]
}

variable "events_routing" {
  description = "Routing rules applied to events prior to pipeline execution"
  type = list(object({
    enabled     = bool
    matcher     = string
    note        = string
    pipeline_id = string
  }))
  default = [
    {
      enabled     = true
      matcher     = "source == 'backend'"
      note        = "Backend-specific routing rule"
      pipeline_id = "events-core"
    }
  ]
}
