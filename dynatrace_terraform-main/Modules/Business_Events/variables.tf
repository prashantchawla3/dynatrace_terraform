variable "buckets_enabled" {
  description = "Enable or disable the business events bucket"
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "Name of the business events bucket"
  type        = string
  default     = "business-events-bucket"
}

variable "buckets_matcher" {
  description = "Matcher expression for the business events bucket"
  type        = string
  default     = "contains(eventType)"
}

variable "rule_name" {
  description = "Common rule name used across multiple resources"
  type        = string
  default     = "BusinessEventsRule"
}

variable "content_type_matcher" {
  description = "Matcher type for content type"
  type        = string
  default     = "EQUALS"
}

variable "content_type_value" {
  description = "Value to match for content type"
  type        = string
  default     = "application/json"
}

variable "parser" {
  description = "Parser type for capturing variants"
  type        = string
  default     = "JSON"
}

variable "scope" {
  description = "Scope for the resource (e.g., environment)"
  type        = string
  default     = "ENVIRONMENT"
}

variable "metrics_enabled" {
  description = "Enable or disable the business events metrics"
  type        = bool
  default     = true
}

variable "metrics_key" {
  description = "Key for the business events metric"
  type        = string
  default     = "metric.event.key"
}

variable "metrics_matcher" {
  description = "Matcher expression for the metric"
  type        = string
  default     = "eventType == \"transaction\""
}

variable "measure" {
  description = "Type of measure (e.g., ATTRIBUTE)"
  type        = string
  default     = "ATTRIBUTE"
}

variable "measure_attribute" {
  description = "Attribute to measure"
  type        = string
  default     = "duration"
}

variable "oneagent_enabled" {
  description = "Enable or disable OneAgent event capturing"
  type        = bool
  default     = true
}

variable "category_source_type" {
  description = "Source type for event category"
  type        = string
  default     = "STATIC"
}

variable "event_data_fields" {
  description = "Map of complex event data fields"
  type = map(object({
    name   = string
    source = object({
      path        = optional(string)
      source      = optional(string)
      source_type = string
    })
  }))
  default = {
    eventType = {
      name = "eventType"
      source = {
        path        = "$.event.type"
        source      = "BODY"
        source_type = "JSON"
      }
    }
  }
}

variable "provider_source" {
  description = "Source value for the provider"
  type        = string
  default     = "Dynatrace"
}

variable "provider_source_type" {
  description = "Source type for the provider"
  type        = string
  default     = "STATIC"
}

variable "type_source" {
  description = "Source value for the event type"
  type        = string
  default     = "Transaction"
}

variable "type_source_type" {
  description = "Source type for the event type"
  type        = string
  default     = "STATIC"
}

variable "trigger_type" {
  description = "Trigger type (e.g., STARTS_WITH)"
  type        = string
  default     = "STARTS_WITH"
}

variable "trigger_case_sensitive" {
  description = "Whether the trigger is case sensitive"
  type        = bool
  default     = false
}

variable "trigger_value" {
  description = "Value to match for the trigger"
  type        = string
  default     = "event-trigger"
}

variable "trigger_data_source" {
  description = "Data source for the trigger"
  type        = string
  default     = "BODY"
}

variable "outgoing_enabled" {
  description = "Enable or disable OneAgent outgoing events"
  type        = bool
  default     = true
}

variable "outgoing_category_source" {
  description = "Source value for outgoing event category"
  type        = string
  default     = "Payment"
}

variable "outgoing_category_source_type" {
  description = "Source type for outgoing event category"
  type        = string
  default     = "STATIC"
}

variable "outgoing_field_name" {
  description = "Name of the outgoing event data field"
  type        = string
  default     = "outgoingField"
}

variable "outgoing_field_path" {
  description = "Path for the outgoing event data field"
  type        = string
  default     = "$.outgoing.field"
}

variable "outgoing_field_source_type" {
  description = "Source type for the outgoing event data field"
  type        = string
  default     = "JSON"
}

variable "outgoing_provider_source" {
  description = "Source value for the outgoing provider"
  type        = string
  default     = "ThirdParty"
}

variable "outgoing_provider_source_type" {
  description = "Source type for the outgoing provider"
  type        = string
  default     = "STATIC"
}

variable "outgoing_type_source" {
  description = "Source value for the outgoing event type"
  type        = string
  default     = "Invoice"
}

variable "outgoing_type_source_type" {
  description = "Source type for the outgoing event type"
  type        = string
  default     = "STATIC"
}

variable "outgoing_trigger_type" {
  description = "Trigger type for outgoing events"
  type        = string
  default     = "EQUALS"
}

variable "outgoing_trigger_case_sensitive" {
  description = "Whether the outgoing trigger is case sensitive"
  type        = bool
  default     = false
}

variable "outgoing_trigger_value" {
  description = "Value to match for the outgoing trigger"
  type        = string
  default     = "invoice-sent"
}

variable "outgoing_trigger_data_source" {
  description = "Data source for the outgoing trigger"
  type        = string
  default     = "BODY"
}

variable "processing_enabled" {
  description = "Enable or disable business events processing"
  type        = bool
  default     = true
}

variable "processing_matcher" {
  description = "Matcher expression for processing"
  type        = string
  default     = "status == \"complete\""
}

variable "processing_script" {
  description = "Script used for processing"
  type        = string
  default     = "return payload.status == 'complete';"
}

variable "sample_event" {
  description = "Sample event used for rule testing"
  type        = string
  default     = "{ \"status\": \"complete\" }"
}

variable "transformation_fields" {
  description = "Map of transformation fields"
  type = map(object({
    name     = string
    type     = string
    array    = bool
    optional = bool
    readonly = bool
  }))
  default = {
    amount = {
      name     = "amount"
      type     = "double"
      array    = false
      optional = true
      readonly = false
    }
  }
}

variable "security_query" {
  description = "Query used in the security context rule"
  type        = string
  default     = "user.role == 'admin'"
}

variable "security_value_source_field" {
  description = "Field used as the value source in the security context"
  type        = string
  default     = "role"
}

variable "security_value_source" {
  description = "Source type for the security context value"
  type        = string
  default     = "BODY"
}
