variable "grail_allowlist" {
  description = "Allow list configuration for Grail."
  type = map(object({
    allow_rules = list(object({
      enabled    = bool
      metric_key = string
      pattern    = string
    }))
  }))
  default = {
    default = {
      allow_rules = [
        {
          enabled    = false
          metric_key = "terraform"
          pattern    = "CONTAINS"
        }
      ]
    }
  }
}
