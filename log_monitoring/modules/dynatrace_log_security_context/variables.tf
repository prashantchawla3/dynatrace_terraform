variable "log_security_context" {
  description = "Security context detection rules from logs"
  type = map(object({
    security_context_rule = object({
      query              = string
      rule_name          = string
      value_source_field = string
      value_source       = string
    })
  }))
  default = {}
}
