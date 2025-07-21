variable "platform_buckets" {
  description = "Custom bucket definitions for Grail data."
  type = map(object({
    display_name = string
    retention    = number
    table        = string
  }))
  default = {
    logs_bucket = {
      display_name = "Custom logs bucket playground"
      retention    = 67
      table        = "logs"
    }
  }
}