variable "problem_propagation_rules" {
  description = "Rules for propagating problems across attributes."
  type = map(object({
    enabled              = bool
    source_attribute_key = string
    target_attribute_key = string
  }))
  default = {
    rule1 = {
      enabled              = false
      source_attribute_key = "terraformSource"
      target_attribute_key = "terraformTarget"
    }
  }
}