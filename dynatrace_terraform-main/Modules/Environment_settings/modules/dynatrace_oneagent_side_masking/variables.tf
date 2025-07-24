variable "app_monitoring_resources" {
  description = "App monitoring configuration resources."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      app_monitoring = object({
        default_log_level   = string
        default_trace_level = string
      })
    })
  }))
  default = []
}

variable "oneagent_side_masking_resources" {
  description = "Side masking rules for sensitive data monitoring in OneAgent."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      oneagent_side_masking = object({
        is_email_masking_enabled     = bool
        is_financial_masking_enabled = bool
        is_numbers_masking_enabled   = bool
        is_query_masking_enabled     = bool
      })
    })
  }))
  default = []
}
