variable "pagerduty_connections" {
  description = "List of PagerDuty connection configs."
  type = list(object({
    name  = string
    token = string
    url   = string
  }))
  default = [
    {
      name  = "pagerduty-main"
      token = "pd-token-xyz987"
      url   = "https://api.pagerduty.com"
    }
  ]
}
