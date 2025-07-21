variable "web_app_beacon_origins" {
  description = "List of beacon origins used for cross-origin communication."
  type = list(object({
    matcher = string
    pattern = string
  }))
  default = []
}
