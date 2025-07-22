variable "pagerduty_connections" {
  description = "List of PagerDuty connection configs."
  type = list(object({
    name  = string
    token = string
    url   = string
  }))
  sensitive = true
}
