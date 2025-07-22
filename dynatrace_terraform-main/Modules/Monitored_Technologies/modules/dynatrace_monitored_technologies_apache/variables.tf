variable "technologies" {
  description = "Map of monitored technologies scoped per host, defining enablement flags and optional .NET Core monitoring support"
  type = map(object({
    enabled              = bool
    host_id              = string
    enabled_dot_net_core = optional(bool)
  }))
  default = {
    java_host = {
      enabled              = true
      host_id              = "host-java-01"
      enabled_dot_net_core = false
    }

    dotnet_host = {
      enabled              = true
      host_id              = "host-dotnet-01"
      enabled_dot_net_core = true
    }

    php_host = {
      enabled              = false
      host_id              = "host-php-01"
    }
  }
}
