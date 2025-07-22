variable "log_processing" {
  description = "Log processing rules and parser definitions"
  type = map(object({
    enabled   = bool
    query     = string
    rule_name = string
    processor_definition = object({
      rule = string
    })
    rule_testing = object({
      sample_log = string
    })
  }))
  default = {}
}
