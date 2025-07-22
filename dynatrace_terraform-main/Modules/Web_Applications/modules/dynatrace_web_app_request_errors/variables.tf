variable "web_app_request_errors" {
  description = "Error rules for failed requests in web applications."
  type = list(object({
    ignore_request_errors_in_apdex_calculation = bool
    scope                                      = string
    error_rules = optional(object({
      consider_csp_violations = bool
      consider_failed_images  = bool
      error_codes             = string
      capture_settings = optional(object({
        capture         = bool
        consider_for_ai = bool
        impact_apdex    = bool
      })
      )
      filter_settings = optional(object({
        filter = string
        url    = string
      }))
    }))
  }))
  default = []
}
