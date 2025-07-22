variable "disk_anomaly_rules" {
  description = "Configurations for disk anomaly rule-based filtering and limits"
  type        = map(object({
    name           = string
    enabled        = bool
    metric         = string
    disk_name_filter = object({
      operator = string
      # Additional disk name filter attributes
    })
    sample_limit = object({
      samples           = number
      violating_samples = number
      # Additional sample limit attributes
    })
  }))
  default = {}
}
