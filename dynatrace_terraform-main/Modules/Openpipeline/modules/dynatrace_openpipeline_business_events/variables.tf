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
