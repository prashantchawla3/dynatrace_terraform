variable "opentelemetry_metrics" {
  description = "Mapping of OpenTelemetry metric ingestion rules including enrichment and filtering logic."
  type = map(object({
    additional_attributes_to_dimension_enabled = bool
    meter_name_to_dimension_enabled           = bool
    scope                                     = string
    additional_attributes = list(object({
      enabled       = bool
      attribute_key = string
    }))
    to_drop_attributes = list(object({
      enabled       = bool
      attribute_key = string
    }))
  }))
  default = {
    metrics_default = {
      additional_attributes_to_dimension_enabled = true
      meter_name_to_dimension_enabled           = false
      scope                                     = "env:default"
      additional_attributes = [
        { enabled = true, attribute_key = "host" },
        { enabled = false, attribute_key = "zone" }
      ]
      to_drop_attributes = [
        { enabled = true, attribute_key = "debug_mode" }
      ]
    }
  }
}
