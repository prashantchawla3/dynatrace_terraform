
variable "grail_allowall" {
  description = "Allow all configuration."
  type = map(object({
    allow_all = bool
  }))
  default = {
    default = {
      allow_all = true
    }
  }
}

variable "grail_allowlist" {
  description = "Allow list configuration for Grail."
  type = map(object({
    allow_rules = list(object({
      enabled    = bool
      metric_key = string
      pattern    = string
    }))
  }))
  default = {
    default = {
      allow_rules = [
        {
          enabled    = false
          metric_key = "terraform"
          pattern    = "CONTAINS"
        }
      ]
    }
  }
}

variable "platform_buckets" {
  description = "Custom bucket definitions for Grail data."
  type = map(object({
    display_name = string
    retention    = number
    table        = string
  }))
  default = {
    logs_bucket = {
      display_name = "Custom logs bucket playground"
      retention    = 67
      table        = "logs"
    }
  }
}

variable "problem_fields" {
  description = "Problem field mapping rules."
  type = map(object({
    enabled       = bool
    event_field   = string
    problem_field = string
  }))
  default = {
    example = {
      enabled       = false
      event_field   = "example_event"
      problem_field = "example_problem"
    }
  }
}

variable "problem_propagation_rules" {
  description = "Rules for propagating problems across attributes."
  type = map(object({
    enabled              = bool
    source_attribute_key = string
    target_attribute_key = string
  }))
  default = {
    rule1 = {
      enabled              = false
      source_attribute_key = "terraformSource"
      target_attribute_key = "terraformTarget"
    }
  }
}

variable "security_contexts" {
  description = "Security contexts with enablement flags."
  type = map(object({
    enabled = bool
  }))
  default = {
    context1 = {
      enabled = true
    }

  }
}