variable "autotag_name" {
  description = "Name of the AutoTag rule to be applied in Dynatrace."
  type        = string
  default     = "AutoTag:TeamOwnership"
}

variable "entity_selector" {
  description = "Entity selector string used to target specific entities in Dynatrace for tagging."
  type        = string
  default     = "type(SERVICE),tag([Environment:Production])"
}

variable "autotag_rules" {
  description = "List of object-based AutoTag rules including propagation, formatting, and match conditions."
  type = list(object({
    type                        = string
    enabled                     = bool
    value_format                = string
    value_normalization         = string
    entity_type                 = string
    service_to_host_propagation = bool
    service_to_pgpropagation    = bool
    conditions = list(object({
      dynamic_key        = string
      dynamic_key_source = string
      key                = string
      operator           = string
      tag                = optional(string)
    }))
  }))
  default = [
    {
      type                        = "PROPERTY"
      enabled                     = true
      value_format                = "{Environment}:{Team}"
      value_normalization         = "UPPERCASE"
      entity_type                 = "SERVICE"
      service_to_host_propagation = true
      service_to_pgpropagation    = false
      conditions = [
        {
          dynamic_key        = "Environment"
          dynamic_key_source = "METADATA"
          key                = "env"
          operator           = "EQUALS"
          tag                = "Environment:Production"
        }
      ]
    }
  ]
}

variable "autotag_selector_rules" {
  description = "List of AutoTag rules using entity selectors instead of metadata conditions."
  type = list(object({
    type                = string
    enabled             = bool
    entity_selector     = string
    value_format        = string
    value_normalization = string
  }))
  default = [
    {
      type                = "ENTITY_SELECTOR"
      enabled             = true
      entity_selector     = "type(HOST),tag([Zone:EU])"
      value_format        = "Zone:EU"
      value_normalization = "NONE"
    }
  ]
}

variable "custom_tags" {
  description = "List of custom tags to assign with context, key, and optional value (used for static annotations)."
  type = list(object({
    context = string
    key     = string
    value   = optional(string)
  }))
  default = [
    {
      context = "CONTEXTLESS"
      key     = "Owner"
      value   = "Platform Team"
    },
    {
      context = "CONTEXTLESS"
      key     = "Criticality"
      value   = "High"
    }
  ]
}
