variable "performance_monitors" {
  description = "Performance threshold monitors scoped by entity. Detect event-triggered performance breaches."
  type = list(object({
    enabled    = bool
    scope      = string
    thresholds = list(object({
      event     = string
      threshold = number
    }))
  }))
  default = [
    {
      enabled = true
      scope   = "monitor:checkout"
      thresholds = [
        { event = "LOADING_TIME", threshold = 1500 },
        { event = "TIME_TO_FIRST_BYTE", threshold = 500 }
      ]
    }
  ]
}
