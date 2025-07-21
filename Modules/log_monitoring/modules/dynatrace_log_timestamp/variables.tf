variable "log_timestamp" {
  description = "Timestamp extraction rules from log patterns"
  type = map(object({
    enabled           = bool
    config_item_title = string
    date_time_pattern = string
    scope             = string
    timezone          = string
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
