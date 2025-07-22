variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for WSMB."
  type = map(object({
    enabled  = bool
    host_id  = string
  }))
  default = {
    wsmb = {
      enabled = true
      host_id = "host-wsmb-001"
    }
  }
}
