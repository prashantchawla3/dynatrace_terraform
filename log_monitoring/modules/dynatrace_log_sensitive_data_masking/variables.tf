variable "log_sensitive_data_masking" {
  description = "Rules for masking sensitive data in logs"
  type = map(object({
    name    = string
    enabled = bool
    scope   = string
    masking = list(object({
      type       = string
      expression = string
    }))
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
