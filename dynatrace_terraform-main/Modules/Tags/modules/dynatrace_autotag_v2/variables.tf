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
variable "entity_selector" {
  description = "Entity selector string used to target specific entities in Dynatrace for tagging."
  type        = string
  default     = "type(SERVICE),tag([Environment:Production])"
}