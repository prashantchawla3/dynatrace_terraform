variable "log_storage" {
  description = "Configuration for log storage routing and filtering"
  type = map(object({
    name            = string
    enabled         = bool
    scope           = string
    send_to_storage = bool
    matchers = list(object({
      matcher = list(object({
        attribute = string
        operator  = string
        values    = list(string)
      }))
    }))
  }))
  default = {}
}
