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
variable "entity_selector" {
  description = "Entity selector string used to target specific entities in Dynatrace for tagging."
  type        = string
  default     = "type(SERVICE),tag([Environment:Production])"
}
