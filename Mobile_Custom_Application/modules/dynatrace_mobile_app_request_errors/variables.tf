variable "mobile_app_request_errors" {
  description = "Configuration of error code rules per mobile app scope."
  type = map(object({
    scope       = string
    error_rules = list(object({
      error_codes = string
    }))
  }))
  default = {
    app_error = {
      scope = "MOBILE:APP"
      error_rules = [
        { error_codes = "404,500" },
        { error_codes = "401" }
      ]
    }
  }
}
