variable "calculated_mobile_metrics" {
  description = "Map of calculated mobile metrics, including app ID, key, type, and dimension ranking."
  type = map(object({
    enabled        = bool
    app_identifier = string
    metric_key     = string
    metric_type    = string
    dimensions     = list(object({
      dimension = string
      top_x     = number
    }))
  }))
  default = {
    app1 = {
      enabled        = true
      app_identifier = "MOBILE-APP-001"
      metric_key     = "crashRate"
      metric_type    = "CUSTOM"
      dimensions     = [
        { dimension = "region", top_x = 5 },
        { dimension = "os",     top_x = 3 }
      ]
    }
  }
}
