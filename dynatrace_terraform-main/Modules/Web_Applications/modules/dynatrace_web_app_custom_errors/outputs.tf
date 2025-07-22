variable "web_app_custom_errors" {
  description = "Custom error detection rules for scoped web applications."
  type = list(object({
    ignore_custom_errors_in_apdex_calculation = bool
    scope                                     = string
    error_rules = optional(object({
      key_matcher   = string
      key_pattern   = string
      value_matcher = string
      value_pattern = string
      capture_settings = optional(object({
        capture         = bool
        consider_for_ai = bool
        impact_apdex    = bool
      }))
    }))
  }))
  default = []
}
