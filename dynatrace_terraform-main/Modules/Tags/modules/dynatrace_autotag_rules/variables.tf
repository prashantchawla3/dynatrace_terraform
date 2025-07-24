
variable "autotag_name" {
  description = "Name of the AutoTag rule to be applied in Dynatrace."
  type        = string
  default     = "AutoTag:TeamOwnership"
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
