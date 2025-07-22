variable "os_services" {
  description = "Configure operating system service monitoring rules with conditions"
  type = list(object({
    name                      = string
    enabled                   = bool
    alert_activation_duration = number
    alerting                  = bool
    monitoring                = bool
    not_installed_alerting    = bool
    scope                     = string
    status_condition_linux    = string
    system                    = string
    condition                 = string
    property                  = string
    metadata_key              = string
    metadata_value            = string
  }))
  default = [
    {
      name                      = "ssh"
      enabled                   = true
      alert_activation_duration = 300
      alerting                  = true
      monitoring                = true
      not_installed_alerting    = false
      scope                     = "host:linux-secure"
      status_condition_linux    = "active"
      system                    = "systemd"
      condition                 = "equals"
      property                  = "status"
      metadata_key              = "env"
      metadata_value            = "prod"
    }
  ]
}
