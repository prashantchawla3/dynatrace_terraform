variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for dotnet."
  type = map(object({
    enabled              = bool
    enabled_dot_net_core = bool
    host_id              = string
  }))
  default = {
    dotnet = {
      enabled              = true
      enabled_dot_net_core = true
      host_id              = "host-12345"
    }
  }
}
