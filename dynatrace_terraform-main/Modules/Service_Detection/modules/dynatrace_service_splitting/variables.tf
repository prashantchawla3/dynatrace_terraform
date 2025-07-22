variable "service_splitting_rules" {
  description = "Rules used to split detected services based on scoped attribute groupings."
  type = map(object({
    enabled = bool
    scope   = string
    rules   = list(object({
      description                   = string
      condition                     = string
      rule_name                     = string
      service_splitting_attributes  = list(object({
        key = string
      }))
    }))
  }))
  default = {}
}
