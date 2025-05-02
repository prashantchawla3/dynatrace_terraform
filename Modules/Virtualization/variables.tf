variable "vmware_configs" {
  description = "Map of VMware configurations for Dynatrace"
  type = map(object({
    enabled   = bool
    ipaddress = string
    label     = string
    password  = string
    username  = string
    filter    = string
  }))
}

variable "environment_url" {
  type = string
}

variable "dynatrace_client_id" {
  type = string
}

variable "dynatrace_client_secret" {
  type      = string
  sensitive = true
}
