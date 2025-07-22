
variable "app_error_rules" {
  description = "List of error capturing rules per web application for custom and HTTP errors."
  type = list(object({
    web_application_id = string
    custom_errors = optional(object({
      capture         = bool
      custom_alerting = bool
      impact_apdex    = bool
      key_matcher     = string
      key_pattern     = string
      value_matcher   = string
      value_pattern   = string
    }))
    http_errors = optional(object({
      capture                     = bool
      consider_blocked_requests   = bool
      consider_for_ai             = bool
      consider_unknown_error_code = bool
      error_codes                 = string
      filter                      = string
      filter_by_url               = bool
      impact_apdex                = bool
      url                         = string
    }))
  }))
  default = []
}
