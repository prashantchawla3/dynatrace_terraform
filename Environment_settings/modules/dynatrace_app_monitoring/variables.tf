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