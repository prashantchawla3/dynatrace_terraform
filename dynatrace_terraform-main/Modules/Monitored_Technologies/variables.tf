variable "technologies" {
  description = "Map of monitored technologies scoped per host. Includes enablement flags, host identifiers, and optional .NET Core support where applicable."
  type = map(object({
    enabled              = bool
    host_id              = string
    enabled_dot_net_core = optional(bool)
  }))
  default = {
    java = {
      enabled              = true
      host_id              = "host-java-001"
      enabled_dot_net_core = false
    }

    dotnet = {
      enabled              = true
      host_id              = "host-dotnet-01"
      enabled_dot_net_core = true
    }

    php = {
      enabled              = true
      host_id              = "host-php-001"
    }

    python = {
      enabled = true
      host_id = "host-python-001"
    }

    go = {
      enabled = true
      host_id = "host-67890"
    }

    iis = {
      enabled = true
      host_id = "host-abcde"
    }

    nginx = {
      enabled = true
      host_id = "host-nginx-001"
    }

    nodejs = {
      enabled = true
      host_id = "host-nodejs-001"
    }

    opentracing = {
      enabled = true
      host_id = "host-opentracing-001"
    }

    wsmb = {
      enabled = true
      host_id = "host-wsmb-001"
    }

    varnish = {
      enabled = true
      host_id = "host-varnish-001"
    }

    apache = {
      enabled = true
      host_id = "host-apache-001"
    }
  }
}
