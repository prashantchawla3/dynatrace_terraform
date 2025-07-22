variable "management_zones" {
  description = "List of management zones"
  type = list(object({
    name            = string
    type            = string
    enabled         = bool
    entity_selector = string
    entity_type     = string
    case_sensitive  = bool
    key             = string
    operator        = string
    string_value    = string
  }))
  default = []
}