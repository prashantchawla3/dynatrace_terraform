enable_business_events = true

business_event_pipelines = [
  {
    enabled      = true
    display_name = "Business Pipeline 1"
    id           = "business-pipeline-1"
    processing = [
      {
        description = "Remove sensitive fields"
        enabled     = true
        fields      = ["password", "ssn"]
        id          = "remove-fields-1"
        matcher     = "event.type == 'login'"
      }
    ]
  }
]

enable_events = true

events_endpoints = [
  {
    enabled        = true
    default_bucket = "default-bucket"
    display_name   = "Events Endpoint 1"
    segment        = "segment-1"
    routing = {
      type        = "static"
      pipeline_id = "events-pipeline-1"
    }
  }
]

events_pipelines = [
  {
    enabled      = true
    display_name = "Events Pipeline 1"
    id           = "events-pipeline-1"
  }
]

events_routing = [
  {
    enabled     = true
    matcher     = "event.source == 'api'"
    note        = "Route API events"
    pipeline_id = "events-pipeline-1"
  }
]

enable_logs = true

logs_pipelines = [
  {
    enabled      = true
    display_name = "Logs Pipeline 1"
    id           = "logs-pipeline-1"
  }
]

enable_security_events = true

security_event_pipelines = [
  {
    enabled      = true
    display_name = "Security Pipeline 1"
    id           = "security-pipeline-1"
  }
]

enable_sdlc_events = true

sdlc_endpoints = [
  {
    display_name = "SDLC Endpoint 1"
    enabled      = true
    segment      = "sdlc-segment-1"
    routing = {
      type        = "dynamic"
      pipeline_id = "sdlc-pipeline-1"
    }
  }
]

sdlc_pipelines = [
  {
    display_name = "SDLC Pipeline 1"
    enabled      = true
    id           = "sdlc-pipeline-1"
  }
]

sdlc_routing = [
  {
    enabled     = true
    matcher     = "event.type == 'build'"
    note        = "Route build events"
    pipeline_id = "sdlc-pipeline-1"
  }
]
