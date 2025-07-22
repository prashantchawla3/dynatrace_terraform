variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for Go."
  type = map(object({
    enabled  = bool
    host_id  = string
  }))
  default = {
    go = {
      enabled = true
      host_id = "host-67890"
    }
  }
}
