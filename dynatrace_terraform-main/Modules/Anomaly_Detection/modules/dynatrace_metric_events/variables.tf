variable "metric_events" {
  description = "Full configuration for Dynatrace metric event definition including thresholds, filters, and alert properties"
  type = object({
    enabled                    = bool
    event_entity_dimension_key = string
    summary                    = string

    event_template = object({
      description = string
      davis_merge = bool
      event_type  = string
      title       = string
    })

    model_properties = object({
      type               = string
      alert_condition    = string
      alert_on_no_data   = bool
      dealerting_samples = number
      samples            = number
      threshold          = number
      violating_samples  = number
    })

    query_definition = object({
      type        = string
      aggregation = string
      metric_key  = string

      dimension_filter = list(object({
        dimension_key   = string
        dimension_value = string
      }))

      entity_filter = object({
        dimension_key = string

        conditions = list(object({
          type     = string
          operator = string
          value    = string
        }))
      })
    })
  })
  default = {
    enabled                    = true
    event_entity_dimension_key = "HOST"
    summary                    = "Alert when CPU usage exceeds threshold"

    event_template = {
      description = "High CPU alert triggered by metric event"
      davis_merge = false
      event_type  = "CUSTOM_ALERT"
      title       = "CPU Usage Anomaly"
    }

    model_properties = {
      type               = "STATIC_THRESHOLD"
      alert_condition    = "ABOVE"
      alert_on_no_data   = false
      dealerting_samples = 3
      samples            = 5
      threshold          = 85
      violating_samples  = 3
    }

    query_definition = {
      type        = "METRIC"
      aggregation = "AVG"
      metric_key  = "builtin:host.cpu.usage"

      dimension_filter = [{
        dimension_key   = "host.name"
        dimension_value = "webserver-01"
      }]

      entity_filter = {
        dimension_key = "host.id"

        conditions = [{
          type     = "STRING"
          operator = "EQUALS"
          value    = "host-001"
        }]
      }
    }
  }
}
