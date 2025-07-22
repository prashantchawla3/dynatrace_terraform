variable "log_metrics" {
  description = "Log-based metric extraction configuration"
  type = map(object({
    enabled           = bool
    dimensions        = list(string)
    key               = string
    measure           = string
    measure_attribute = string
    query             = string
  }))
  default = {}
}
