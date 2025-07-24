variable "technologies" {
  description = <<-EOT
    Map of monitored technologies scoped per host.
    This block configures enablement and host-level settings for supported technologies.
    Includes Apache with flags to control activation and target host.
  EOT

  type = map(object({
    enabled              = bool
    host_id              = string
    enabled_dot_net_core = optional(bool) # Included for compatibility with .NET-style schemas
  }))

  default = {
    apache = {
      enabled = true
      host_id = "host-apache-001"
    }
  }
}
