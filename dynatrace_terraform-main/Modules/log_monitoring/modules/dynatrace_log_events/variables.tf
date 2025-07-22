variable "log_events" {
  description = "Event definitions extracted from logs"
  type = map(object({
    enabled = bool
    query   = string
    summary = string
    event_template = object({
      description = string
      event_type  = string
      title       = string
      metadata = object({
        items = list(object({
          metadata_key   = string
          metadata_value = string
        }))
      })
    })
  }))
  default = {}
}
