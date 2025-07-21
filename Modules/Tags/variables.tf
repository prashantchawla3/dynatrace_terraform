

variable "autotag_name" { type = string }
variable "entity_selector" { type = string }

variable "autotag_rules" {
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
}

variable "autotag_selector_rules" {
  type = list(object({
    type                = string
    enabled             = bool
    entity_selector     = string
    value_format        = string
    value_normalization = string
  }))
}

variable "custom_tags" {
  type = list(object({
    context = string
    key     = string
    value   = optional(string)
  }))
}
