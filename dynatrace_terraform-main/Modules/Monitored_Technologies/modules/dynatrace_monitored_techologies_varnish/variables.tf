variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for Varnish."
  type = map(object({
    enabled  = bool
    host_id  = string
  }))
  default = {
    varnish = {
      enabled = true
      host_id = "host-varnish-001"
    }
  }
}
