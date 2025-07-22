variable "management_zones" {
  description = "List of management zones, each containing a set of entity-based rule definitions."
  type = list(object({
    name  = string
    rules = list(object({
      type            = string
      enabled         = bool
      entity_selector = string
      entity_type     = string
      condition = object({
        case_sensitive = bool
        key            = string
        operator       = string
        string_value   = string
      })
    }))
  }))
  default = []
}