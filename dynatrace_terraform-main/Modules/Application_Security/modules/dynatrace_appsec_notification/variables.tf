variable "notifications" {
  description = "List of webhook notifications"
  type = list(object({
    type                   = string
    enabled                = bool
    display_name           = string
    alerting_profile       = string
    trigger                = string
    payload                = string
    accept_any_certificate = bool
    url                    = string
  }))
  default = []
}