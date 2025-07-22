variable "request_naming_rules" {
  description = "Map of request naming rules with associated conditions and optional placeholders."
  type = map(object({
    naming_pattern   = string
    enabled          = optional(bool)
    management_zones = optional(set(string))
    conditions = list(object({
      condition = list(object({
        attribute  = string
        comparison = optional(object({
          fast_string = object({
            value    = string
            operator = string
          })
        }))
      }))
    }))
    placeholders = optional(object({
      placeholder = list(object({
        name      = string
        kind      = string
        attribute = string
      }))
    }))
  }))
  default = {}
}

variable "request_naming_ids" {
  description = "List of request naming rule IDs in execution order."
  type        = list(string)
  default     = []
}
variable "naming_pattern" {
  description = "Default naming pattern used when constructing request names."
  type        = string
  default     = "{method}-{path}"
}
