# ── Attribute Filtering ─────────────────────
variable "attribute_allow_list" {
  description = "Map of attributes explicitly allowed for processing."
  type = map(object({
    enabled = bool
    key     = string
  }))
  default = {
    trace_id = {
      enabled = true
      key     = "trace_id"
    }
  }
}

variable "attribute_block_list" {
  description = "Map of attributes to block from processing."
  type = map(object({
    enabled = bool
    key     = string
  }))
  default = {
    internal_token = {
      enabled = true
      key     = "internal_session_token"
    }
  }
}

variable "attribute_masking" {
  description = "Map of sensitive attributes with masking strategies (e.g., SHA256)."
  type = map(object({
    enabled = bool
    key     = string
    masking = string
  }))
  default = {
    user_email = {
      enabled = true
      key     = "email"
      masking = "SHA256"
    }
  }
}

# ── OpenTelemetry Metric Configurations ─────
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

# ── Span Behavior Rules ─────────────────────
variable "span_capture_rules" {
  description = "Rules controlling whether spans are captured based on match filters."
  type = map(object({
    action  = string
    matches = list(object({
      comparison = string
      source     = string
      value      = string
    }))
  }))
  default = {
    capture_login = {
      action = "ALLOW"
      matches = [
        {
          comparison = "EQUALS"
          source     = "url.path"
          value      = "/auth/login"
        }
      ]
    }
  }
}

variable "span_context_propagation" {
  description = "Span context propagation configuration for distributed tracing."
  type = map(object({
    action  = string
    matches = list(object({
      comparison = string
      source     = string
      value      = string
    }))
  }))
  default = {
    propagate_trace = {
      action = "INJECT"
      matches = [
        {
          comparison = "CONTAINS"
          source     = "http.headers"
          value      = "x-trace-id"
        }
      ]
    }
  }
}

variable "span_entry_points" {
  description = "Configuration for span entry points based on URL or request path matching."
  type = map(object({
    action  = string
    matches = list(object({
      case_sensitive = bool
      comparison     = string
      source         = string
      value          = string
    }))
  }))
  default = {
    public_api = {
      action = "ALLOW"
      matches = [
        {
          case_sensitive = true
          comparison     = "STARTS_WITH"
          source         = "url.path"
          value          = "/api/"
        }
      ]
    }
  }
}

# ── Attribute Persistence ───────────────────
variable "attributes_preferences" {
  description = "Map of attribute persistence preferences (e.g., TRANSIENT, PERSISTENT)."
  type = map(object({
    persistence_mode = string
  }))
  default = {
    telemetry_defaults = {
      persistence_mode = "TRANSIENT"
    }
  }
}
