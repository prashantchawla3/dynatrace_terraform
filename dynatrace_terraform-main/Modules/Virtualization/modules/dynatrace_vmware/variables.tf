variable "vmware_configs" {
  description = "Map of VMware vCenter configurations for Dynatrace integration, keyed by instance ID. Each entry defines credentials, IP address, label, and filtering options."
  type = map(object({
    enabled   = bool
    ipaddress = string
    label     = string
    password  = string
    username  = string
    filter    = string
  }))
  default = {
    vcenter_prod = {
      enabled   = true
      ipaddress = "192.168.1.100"
      label     = "Production vCenter"
      password  = "changeme-prod"
      username  = "admin"
      filter    = "dc=prod*"
    }

    vcenter_test = {
      enabled   = false
      ipaddress = "192.168.1.101"
      label     = "Test vCenter"
      password  = "changeme-test"
      username  = "testuser"
      filter    = "dc=test*"
    }
  }
}
