variable "host_naming" {
  description = "Override host display naming rules with custom format"
  type = list(object({
    enabled = bool
    format  = string
    name    = string
  }))
  default = [
    {
      enabled = true
      format  = "{HostName}-{Environment}"
      name    = "prod-host-eu"
    }
  ]
}
