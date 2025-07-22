variable "web_app_beacon_endpoints" {
  description = "List of beacon endpoints used by Dynatrace agents to report data."
  type = list(object({
    application_id = string
    type           = string
    url            = string
    use_cors       = bool
  }))
  default = []
}
