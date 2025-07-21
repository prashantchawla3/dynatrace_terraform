variable "enable_business_events" {
  description = "Toggle to enable ingestion and processing of business events"
  type        = bool
  default     = true
}

variable "business_event_pipelines" {
  description = "List of business event pipelines with their processors and settings"
  type = list(object({
    enabled      = bool
    display_name = string
    id           = string
    processing = list(object({
      description = string
      enabled     = bool
      fields      = list(string)
      id          = string
      matcher     = string
    }))
  }))
  default = [
    {
      enabled      = true
      display_name = "Revenue Tracker"
      id           = "biz-revenue"
      processing   = [
        {
          description = "Extract revenue-related fields"
          enabled     = true
          fields      = ["customer_id", "invoice_amount"]
          id          = "proc-001"
          matcher     = "event.type == 'invoice'"
        }
      ]
    }
  ]
}

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

variable "enable_logs" {
  description = "Toggle to enable log ingestion and processing"
  type        = bool
  default     = true
}

variable "logs_pipelines" {
  description = "List of log pipelines enabled for processing structured or unstructured logs"
  type = list(object({
    enabled      = bool
    display_name = string
    id           = string
  }))
  default = [
    {
      enabled      = true
      display_name = "App Logs Parser"
      id           = "logs-app-core"
    }
  ]
}

variable "enable_security_events" {
  description = "Enable ingestion of security-related events"
  type        = bool
  default     = true
}

variable "security_event_pipelines" {
  description = "List of security event pipelines enabled for threat detection"
  type = list(object({
    enabled      = bool
    display_name = string
    id           = string
  }))
  default = [
    {
      enabled      = true
      display_name = "Security Monitor"
      id           = "security-pipe-core"
    }
  ]
}

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
