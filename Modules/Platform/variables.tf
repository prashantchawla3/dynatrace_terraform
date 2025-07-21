variable "generic_settings" {
  type = map(object({
    schema = string
    scope  = string
    value  = map(string)
  }))
}

variable "grail_allowall" {
  type = map(object({
    allow_all = bool
  }))
}

variable "grail_allowlist" {
  type = map(object({
    allow_rules = list(object({
      enabled    = bool
      metric_key = string
      pattern    = string
    }))
  }))
}

variable "platform_buckets" {
  type = map(object({
    display_name = string
    retention    = number
    table        = string
  }))
}

variable "problem_fields" {
  type = map(object({
    enabled       = bool
    event_field   = string
    problem_field = string
  }))
}

variable "problem_propagation_rules" {
  type = map(object({
    enabled              = bool
    source_attribute_key = string
    target_attribute_key = string
  }))
}

variable "security_contexts" {
  type = map(object({
    enabled = bool
  }))
}
