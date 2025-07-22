variable "service_detection_rules" {
  description = "Service detection logic mapped per scope with rule-based attribute matching."
  type = map(object({
    enabled = bool
    scope   = string
    rules   = list(object({
      description                    = string
      additional_required_attributes = list(string)
      condition                      = string
      rule_name                      = string
      service_name_template          = string
    }))
  }))
  default = {}
}
