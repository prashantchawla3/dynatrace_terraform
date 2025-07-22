variable "custom_services" {
  description = "Custom service definitions with technology-specific rule sets for class and method detection."
  type = list(object({
    name             = string
    technology       = string
    enabled          = bool
    queue_entry_point = bool
    rules = list(object({
      enabled     = bool
      class_name  = string
      class_match = string
      annotations = optional(list(string))
      methods     = list(object({
        name      = string
        arguments = optional(list(string))
        returns   = string
      }))
    }))
  }))
  default = []
}
